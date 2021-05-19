
// Parameters:
// 
// -->Input tables:
// 
// CustomersTransactions**
//	*Period
//	*Company
//	*Currency
//	*Partner
//	*LegalName
//	*TransactionDocument
//	*AdvanceBasis
//	*Agreement
//	*DocumentAmount
//	*DueAsAdvance
//
//-------------------------------------------
// Aging
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *Invoice
//  *PaymentDate
//  *Agreement
//  *Amount
//  
// <--Output tables:
//
// DueAsAdvanceFromCustomers**
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *LegalName
//  *TransactionDocument
//  *Agreement
//  *Amount
//
// OffsetOfAging
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *Invoice
//  *PaymentDate
//  *Agreement
//  *Amount
Procedure Customers_OnReturn(Parameters) Export
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = 
	"SELECT
	|	Transactions.Period,
	|	Transactions.Company,
	|	Transactions.Currency,
	|	Transactions.Partner,
	|	Transactions.LegalName,
	|	Transactions.TransactionDocument,
	|	Transactions.AdvanceBasis,
	|	Transactions.Agreement,
	|	Transactions.DocumentAmount,
	|	Transactions.DueAsAdvance
	|INTO Transactions
	|FROM
	|	CustomersTransactions AS Transactions
	|WHERE
	|	Transactions.DueAsAdvance
	|;
	|
	|
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	TransactionsBalance.Company,
	|	TransactionsBalance.Currency,
	|	TransactionsBalance.LegalName,
	|	TransactionsBalance.Partner,
	|	TransactionsBalance.Agreement,
	|	SUM(TransactionsBalance.AmountBalance) - SUM(Transactions.DocumentAmount) AS Amount,
	|	Transactions.Period,
	|	Transactions.TransactionDocument,
	|	Transactions.AdvanceBasis
	|INTO TransactionsBalance
	|FROM
	|	AccumulationRegister.R2021B_CustomersTransactions.Balance(&Period, (Company, Currency, LegalName, Partner, Agreement,
	|		CurrencyMovementType) IN
	|		(SELECT
	|			Transactions.Company,
	|			Transactions.Currency,
	|			Transactions.LegalName,
	|			Transactions.Partner,
	|			Transactions.Agreement,
	|			VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
	|		FROM
	|			Transactions AS Transactions)) AS TransactionsBalance
	|		INNER JOIN Transactions AS Transactions
	|		ON TransactionsBalance.Company = Transactions.Company
	|		AND TransactionsBalance.Partner = Transactions.Partner
	|		AND TransactionsBalance.LegalName = Transactions.LegalName
	|		AND TransactionsBalance.Agreement = Transactions.Agreement
	|		AND TransactionsBalance.Currency = Transactions.Currency
	|		AND Transactions.DueAsAdvance
	|GROUP BY
	|	TransactionsBalance.Company,
	|	TransactionsBalance.Currency,
	|	TransactionsBalance.LegalName,
	|	TransactionsBalance.Partner,
	|	TransactionsBalance.Agreement,
	|	Transactions.Period,
	|	Transactions.TransactionDocument,
	|	Transactions.AdvanceBasis
	|;
	|
	|
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	TransactionsBalance.Period,
	|	TransactionsBalance.Company,
	|	TransactionsBalance.Partner,
	|	TransactionsBalance.LegalName,
	|	TransactionsBalance.Agreement,
	|	TransactionsBalance.Currency,
	|	TransactionsBalance.TransactionDocument,
	|	TransactionsBalance.AdvanceBasis,
	|	TransactionsBalance.Amount
	|INTO DueAsAdvanceFromCustomers
	|FROM
	|	TransactionsBalance AS TransactionsBalance
	|WHERE
	|	TransactionsBalance.Amount < 0";
	Query.SetParameter("Period", New Boundary(Parameters.PointInTime, BoundaryType.Excluding));
	Query.Execute();
EndProcedure

Procedure Customers_OnReturn_Unposting(Parameters) Export
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = 
	"SELECT
	|	Table.Period,
	|	Table.Company,
	|	Table.Currency,
	|	Table.Partner,
	|	Table.LegalName,
	|	Table.Basis AS TransactionDocument,
	|	Table.Basis AS AdvancesDocument,
	|	Table.Basis AS AdvanceBasis,
	|	Table.Agreement,
	|	Table.Amount
	|INTO DueAsAdvanceFromCustomers
	|FROM
	|	AccumulationRegister.R2021B_CustomersTransactions AS Table
	|WHERE
	|	FALSE
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	Table.Period,
	|	Table.Company,
	|	Table.Currency,
	|	Table.Partner,
	|	Table.Invoice,
	|	Table.PaymentDate,
	|	Table.Agreement,
	|	Table.Amount
	|INTO OffsetOfAging
	|FROM
	|	AccumulationRegister.R5011B_CustomersAging AS Table
	|WHERE
	|	FALSE";
	Query.Execute();	
EndProcedure	

// Parameters:
// 
// -->Input tables:
// 
// CustomersTransactions
//	*Period
//	*Company
//	*Currency
//	*Partner
//	*LegalName
//	*TransactionDocument
//	*Agreement
//	*DocumentAmount
//	*IgnoreAdvances
//
// Aging
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *Invoice
//  *PaymentDate
//  *Agreement
//  *Amount
//  
// <--Output tables:
//
// OffsetOfAdvance
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *LegalName
//  *TransactionDocument
//  *AdvancesDocument
//  *Agreement
//  *Amount
//
// OffsetOfAging
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *Invoice
//  *PaymentDate
//  *Agreement
//  *Amount
Procedure Customers_OnTransaction(Parameters) Export	
	AdvancesOnTransaction(Parameters, "R2020B_AdvancesFromCustomers" , "CustomersTransactions", "OffsetOfAdvanceFromCustomers");

#Region Aging
	
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;

	Query.Text = 
	"SELECT
	|	Aging.Period,
	|	Aging.Company,
	|	Aging.Partner,
	|	Aging.Agreement,
	|	Aging.Invoice,
	|	Aging.PaymentDate,
	|	Aging.Currency,
	|	Aging.Amount AS DueAmount,
	|	OffsetOfAdvanceFromCustomers.Amount AS Amount_OffsetOfAdvance,
	|	OffsetOfAdvanceFromCustomers.AdvancesDocument,
	|	0 AS Amount
	|FROM
	|	Aging AS Aging
	|		INNER JOIN OffsetOfAdvanceFromCustomers AS OffsetOfAdvanceFromCustomers
	|		ON Aging.Company = OffsetOfAdvanceFromCustomers.Company
	|		AND Aging.Partner = OffsetOfAdvanceFromCustomers.Partner
	|		AND Aging.Agreement = OffsetOfAdvanceFromCustomers.Agreement
	|		AND Aging.Invoice = OffsetOfAdvanceFromCustomers.TransactionDocument
	|		AND Aging.Currency = OffsetOfAdvanceFromCustomers.Currency
	|ORDER BY
	|	PaymentDate";
	
	QueryResult = Query.Execute();
	OffsetOfAging = QueryResult.Unload();
	OffsetOfAging_Groupped = OffsetOfAging.Copy();
	
	OffsetOfAging_Groupped.GroupBy("AdvancesDocument, Amount_OffsetOfAdvance");
	OffsetOfAging.GroupBy("Period, Company, Partner, Agreement, Invoice, PaymentDate, Currency, DueAmount, Amount");
	
	For Each Row_Advance In OffsetOfAging_Groupped Do
		NeedWriteOff = Row_Advance.Amount_OffsetOfAdvance;
		For Each Row In OffsetOfAging Do
			If Not NeedWriteOff > 0 Then
				Break;
			EndIf;
			If Row.DueAmount > 0 Then
				CanWriteOff   = Min(Row.DueAmount, NeedWriteOff);
				NeedWriteOff  = NeedWriteOff - CanWriteOff;
				Row.DueAmount = Row.DueAmount - CanWriteOff;
				Row.Amount    = Row.Amount + CanWriteOff;
			EndIf;
		EndDo;
	EndDo;
	
	ArrayForDelete = New Array();
	For Each Row In OffsetOfAging Do
		If Not ValueIsFilled(Row.Amount) Then
			ArrayForDelete.Add(Row);
		EndIf;
	EndDo;
	For Each ItemOfArray In ArrayForDelete Do
		OffsetOfAging.Delete(ItemOfArray);
	EndDo;
	
	PutAgingTableToTempTables(Query, OffsetOfAging);
		
#EndRegion
		
EndProcedure

Procedure Customers_OnTransaction_Unposting(Parameters) Export
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = 
	"SELECT
	|	Table.Period,
	|	Table.Company,
	|	Table.Currency,
	|	Table.Partner,
	|	Table.LegalName,
	|	Table.Basis AS TransactionDocument,
	|	Table.Basis AS AdvancesDocument,
	|	Table.Agreement,
	|	Table.Amount
	|INTO OffsetOfAdvanceFromCustomers
	|FROM
	|	AccumulationRegister.R2021B_CustomersTransactions AS Table
	|WHERE
	|	FALSE
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	Table.Period,
	|	Table.Company,
	|	Table.Currency,
	|	Table.Partner,
	|	Table.Invoice,
	|	Table.PaymentDate,
	|	Table.Agreement,
	|	Table.Amount
	|INTO OffsetOfAging
	|FROM
	|	AccumulationRegister.R5011B_CustomersAging AS Table
	|WHERE
	|	FALSE";
	Query.Execute();	

EndProcedure

// Parameters:
// 
// -->Input tables:
// 
// VendorsTransactions
//	*Period
//	*Company
//	*Currency
//	*Partner
//	*LegalName
//	*TransactionDocument
//	*Agreement
//	*DocumentAmount
//
// <--Output tables:
//
// OffsetOfAdvance
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *LegalName
//  *TransactionDocument
//  *AdvancesDocument
//  *Agreement
//  *Amount
Procedure Vendors_OnTransaction(Parameters) Export
	AdvancesOnTransaction(Parameters, "R1020B_AdvancesToVendors", "VendorsTransactions", "OffsetOfAdvanceToVendors");
EndProcedure

Procedure Vendors_OnTransaction_Unposting(Parameters) Export
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = 
	"SELECT
	|	Table.Period,
	|	Table.Company,
	|	Table.Currency,
	|	Table.Partner,
	|	Table.LegalName,
	|	Table.Basis AS TransactionDocument,
	|	Table.Basis AS AdvancesDocument,
	|	Table.Agreement,
	|	Table.Amount
	|INTO OffsetOfAdvance
	|FROM
	|	AccumulationRegister.R1021B_VendorsTransactions AS Table
	|WHERE
	|	FALSE";
	Query.Execute();	
EndProcedure	

Procedure AdvancesOnTransaction(Parameters, RegisterName, TransactionsTableName, OffsetOfAdvanceTableName)
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = StrTemplate(GetQueryTextAdvancesOnTransaction(), RegisterName, TransactionsTableName);
	Query.SetParameter("Period", New Boundary(Parameters.RecorderPointInTime, BoundaryType.Excluding));
	QueryResult = Query.Execute();	
	AdvancesTable = QueryResult.Unload();
	OffsetOfAdvance = DistributeAdvancesTableOnTransaction(AdvancesTable);
	PutAdvancesTableToTempTables(Query, OffsetOfAdvance, OffsetOfAdvanceTableName);
EndProcedure

Function GetQueryTextAdvancesOnTransaction()
	Return
		"SELECT
		|	Transactions.Period,
		|	Transactions.Company,
		|	Transactions.Partner,
		|	Transactions.LegalName,
		|	Transactions.Currency,
		|	Transactions.TransactionDocument,
		|	Transactions.Agreement,
		|	SUM(Transactions.DocumentAmount) AS DocumentAmount,
		|	Advances.Basis AS AdvancesDocument,
		|	SUM(Advances.AmountBalance) AS BalanceAmount,
		|	0 AS Amount,
		|	"""" AS Key
		|FROM
		|	AccumulationRegister.%1.Balance(&Period, (Company, Partner, LegalName, Currency,
		|		CurrencyMovementType) IN
		|		(SELECT
		|			Transactions.Company,
		|			Transactions.Partner,
		|			Transactions.LegalName,
		|			Transactions.Currency,
		|			VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
		|		FROM
		|			%2 AS Transactions)) AS Advances
		|		LEFT JOIN %2 AS Transactions
		|		ON Advances.Company = Transactions.Company
		|		AND Advances.Partner = Transactions.Partner
		|		AND Advances.LegalName = Transactions.LegalName
		|		AND Advances.Currency = Transactions.Currency
		|		AND Advances.CurrencyMovementType = VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
		|WHERE
		|	NOT Transactions.IgnoreAdvances
		|GROUP BY
		|	Transactions.Period,
		|	Transactions.Company,
		|	Transactions.Partner,
		|	Transactions.LegalName,
		|	Transactions.Currency,
		|	Transactions.TransactionDocument,
		|	Transactions.Agreement,
		|	Advances.Basis,
		|	VALUE(AccumulationRecordType.Expense)
		|ORDER BY
		|	Advances.Basis.Date,
		|	Transactions.Period";
EndFunction		

Function DistributeAdvancesTableOnTransaction(AdvancesTable)
	OffsetOfAdvance = AdvancesTable.CopyColumns();
	
	AdvancesTable_Groupped = AdvancesTable.Copy();
	
	FilterFields = 
		"Period, 
		|Company,
		|Partner, 
		|LegalName, 
		|Currency,  
		|TransactionDocument, 
		|Agreement,
		|DocumentAmount, 
		|Amount"; 
	AdvancesTable_Groupped.GroupBy(FilterFields);
	For Each Row In AdvancesTable_Groupped Do
		NeedWriteOff = Row.DocumentAmount;
		Filter = New Structure(FilterFields);
		FillPropertyValues(Filter, Row);
		ArrayOfRows = AdvancesTable.FindRows(Filter);
		For Each ItemOfArray In ArrayOfRows Do
			If Not ItemOfArray.BalanceAmount > 0 Then
				Continue;
			EndIf;
			CanWriteOff = Min(ItemOfArray.BalanceAmount, NeedWriteOff);
			NeedWriteOff = NeedWriteOff - CanWriteOff;
			ItemOfArray.BalanceAmount = ItemOfArray.BalanceAmount - CanWriteOff;
			
			NewRow = OffsetOfAdvance.Add();
			FillPropertyValues(NewRow, Row);
			NewRow.Amount = CanWriteOff;
			NewRow.AdvancesDocument = ItemOfArray.AdvancesDocument;
			
			If NeedWriteOff = 0 Then
				Break;
			EndIf;
		EndDo;
	EndDo;
	Return OffsetOfAdvance;
EndFunction	

// Parameters:
// 
// -->Input tables:
// 
// AdvancesFromCustomers
//  *Period
//  *Company
//  *Partner
//  *LegalName
//  *Currency
//  *DocumentAmount
//  *ReceiptDocument
//  *Key
//  *IgnoreAdvances
//	
// CustomersTransactions
//  *Period
//  *Company
//  *TransactionDocument
//  *Partner
//  *LegalName
//  *Agreement
//  *Currency
//  *Amount
//  *Key
//
// <--Output tables:
//
// OffsetOfAdvance
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *LegalName
//  *TransactionDocument
//  *AdvancesDocument
//  *Agreement
//  *Amount
//
// OffsetOfAging
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *Invoice
//  *PaymentDate
//  *Agreement
//  *Amount
Procedure Customers_OnMoneyMovements(Parameters) Export
		
AdvancesOnMoneyMovements(Parameters, "R2021B_CustomersTransactions", "AdvancesFromCustomers", "CustomersTransactions", "OffsetOfAdvanceFromCustomers");
		
#Region Aging

	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;

	Query.Text = 
	"SELECT
	|	OffsetOfAdvanceFromCustomers.Company,
	|	OffsetOfAdvanceFromCustomers.Partner,
	|	OffsetOfAdvanceFromCustomers.Agreement,
	|	OffsetOfAdvanceFromCustomers.TransactionDocument AS Invoice,
	|	OffsetOfAdvanceFromCustomers.Currency
	|INTO R5011B_CustomersAging_OffsetOfAging_Lock
	|FROM
	|	OffsetOfAdvanceFromCustomers AS OffsetOfAdvanceFromCustomers
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	CustomersTransactions.Period,
	|	CustomersTransactions.Company,
	|	CustomersTransactions.TransactionDocument AS Basis,
	|	CustomersTransactions.Partner,
	|	CustomersTransactions.LegalName,
	|	CustomersTransactions.Agreement,
	|	CustomersTransactions.Currency,
	|	CustomersTransactions.Amount
	|INTO Transactions
	|FROM
	|	CustomersTransactions AS CustomersTransactions
	|
	|UNION ALL
	|
	|SELECT
	|	OffsetOfAdvanceFromCustomers.Period,
	|	OffsetOfAdvanceFromCustomers.Company,
	|	OffsetOfAdvanceFromCustomers.TransactionDocument,
	|	OffsetOfAdvanceFromCustomers.Partner,
	|	OffsetOfAdvanceFromCustomers.LegalName,
	|	OffsetOfAdvanceFromCustomers.Agreement,
	|	OffsetOfAdvanceFromCustomers.Currency,
	|	OffsetOfAdvanceFromCustomers.Amount
	|FROM
	|	OffsetOfAdvanceFromCustomers AS OffsetOfAdvanceFromCustomers
	|;
	|
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	Transactions.Period,
	|	Transactions.Company,
	|	Transactions.Basis,
	|	Transactions.Partner,
	|	Transactions.LegalName,
	|	Transactions.Agreement,
	|	Transactions.Currency,
	|	SUM(Transactions.Amount) AS Amount
	|INTO TransactionsGroupped
	|FROM
	|	Transactions AS Transactions
	|GROUP BY
	|	Transactions.Period,
	|	Transactions.Company,
	|	Transactions.Basis,
	|	Transactions.Partner,
	|	Transactions.LegalName,
	|	Transactions.Agreement,
	|	Transactions.Currency";
	Query.Execute();
	Aging_Lock = PostingServer.GetQueryTableByName("R5011B_CustomersAging_OffsetOfAging_Lock", Parameters);
		
	DataLock = New DataLock();
	LockFields = AccumulationRegisters.R5011B_CustomersAging.GetLockFields(Aging_Lock);
	DataLockItem = DataLock.Add(LockFields.RegisterName);
	DataLockItem.Mode = DataLockMode.Exclusive;
	DataLockItem.DataSource = LockFields.LockInfo.Data;
	For Each Field In LockFields.LockInfo.Fields Do
		DataLockItem.UseFromDataSource(Field.Key, Field.Value);
	EndDo;
	If LockFields.LockInfo.Data.Count() Then
		DataLock.Lock();
		Parameters.Insert("R5011B_CustomersAging_OffsetOfAging_Lock", DataLock);
	EndIf;	
	
	Query.Text = 
	"SELECT
	|	TransactionsGroupped.Period,
	|	R5011B_CustomersAgingBalance.Company,
	|	R5011B_CustomersAgingBalance.Partner,
	|	R5011B_CustomersAgingBalance.Agreement,
	|	R5011B_CustomersAgingBalance.Invoice,
	|	R5011B_CustomersAgingBalance.PaymentDate AS PaymentDate,
	|	R5011B_CustomersAgingBalance.Currency,
	|	R5011B_CustomersAgingBalance.AmountBalance AS DueAmount,
	|	TransactionsGroupped.Amount AS ReceiptAmount,
	|	0 AS Amount
	|FROM
	|	AccumulationRegister.R5011B_CustomersAging.Balance(&Period, (Company, Partner, Agreement, Invoice, Currency) IN
	|		(SELECT
	|			TransactionsGroupped.Company,
	|			TransactionsGroupped.Partner,
	|			TransactionsGroupped.Agreement,
	|			TransactionsGroupped.Basis,
	|			TransactionsGroupped.Currency
	|		FROM
	|			TransactionsGroupped AS TransactionsGroupped)) AS R5011B_CustomersAgingBalance
	|		INNER JOIN TransactionsGroupped AS TransactionsGroupped
	|		ON R5011B_CustomersAgingBalance.Company = TransactionsGroupped.Company
	|		AND R5011B_CustomersAgingBalance.Partner = TransactionsGroupped.Partner
	|		AND R5011B_CustomersAgingBalance.Agreement = TransactionsGroupped.Agreement
	|		AND R5011B_CustomersAgingBalance.Invoice = TransactionsGroupped.Basis
	|		AND R5011B_CustomersAgingBalance.Currency = TransactionsGroupped.Currency
	|ORDER BY
	|	PaymentDate";
	
	Query.SetParameter("Period", New Boundary(Parameters.RecorderPointInTime, BoundaryType.Excluding));
	QueryResult = Query.Execute();
	QueryTable = QueryResult.Unload();
	QueryTable_Groupped = QueryTable.Copy();
	QueryTable_Groupped.GroupBy("Invoice, ReceiptAmount");
	QueryTable.GroupBy("Period, Company, Partner, Agreement, Invoice, PaymentDate, Currency, DueAmount, Amount");
	For Each Row In QueryTable_Groupped Do
		NeedWriteOff = Row.ReceiptAmount;
		ArrayOfRows = QueryTable.FindRows(New Structure("Invoice", Row.Invoice));
		For Each ItemOfArray In ArrayOfRows Do
			If Not NeedWriteOff > 0 Then
				Break;
			EndIf;
			If ItemOfArray.DueAmount > 0 Then
				CanWriteOff   = Min(ItemOfArray.DueAmount, NeedWriteOff);
				NeedWriteOff  = NeedWriteOff - CanWriteOff;
				ItemOfArray.DueAmount = ItemOfArray.DueAmount - CanWriteOff;
				ItemOfArray.Amount    = ItemOfArray.Amount + CanWriteOff;
			EndIf;
		EndDo;
	EndDo;
	
	ArrayForDelete = New Array();
	For Each Row In QueryTable Do
		If Not ValueIsFilled(Row.Amount) Then
			ArrayForDelete.Add(Row);
		EndIf;
	EndDo;
	For Each ItemOfArray In ArrayForDelete Do
		QueryTable.Delete(ItemOfArray);
	EndDo;
	
	Query.Text =  
	"SELECT
	|	Table_OffsetOfAging.Period,
	|	Table_OffsetOfAging.Company,
	|	Table_OffsetOfAging.Partner,
	|	Table_OffsetOfAging.Agreement,
	|	Table_OffsetOfAging.Invoice,
	|	Table_OffsetOfAging.PaymentDate,
	|	Table_OffsetOfAging.Currency,
	|	Table_OffsetOfAging.Amount
	|INTO OffsetOfAging
	|FROM
	|	&Table_OffsetOfAging AS Table_OffsetOfAging";
	Query.SetParameter("Table_OffsetOfAging", QueryTable);
	Query.Execute();

#EndRegion	
	
EndProcedure

// Parameters:
// 
// -->Input tables:
// 
// AdvancesToVendors
//  *Period
//  *Company
//  *Partner
//  *LegalName
//  *Currency
//  *DocumentAmount
//  *AdvancesDocument
//  *Key
//	
// VendorsTransactions
//  *Period
//  *Company
//  *TransactionDocument
//  *Partner
//  *LegalName
//  *Agreement
//  *Currency
//  *Amount
//  *Key
//
// <--Output tables:
//
// OffsetOfAdvance
//  *Period
//  *Company
//  *Currency
//  *Partner
//  *LegalName
//  *TransactionDocument
//  *AdvancesDocument
//  *Agreement
//  *Amount
Procedure Vendors_OnMoneyMovements(Parameters) Export
	AdvancesOnMoneyMovements(Parameters, "R1021B_VendorsTransactions", "AdvancesToVendors", "VendorsTransactions", "OffsetOfAdvanceToVendors");
EndProcedure

Procedure AdvancesOnMoneyMovements(Parameters, RegisterName, AdvancesTableName, TransactionsTableName, OffsetOfAdvanceTableName)
	Query = New Query();
	Query.TempTablesManager = Parameters.TempTablesManager;
	Query.Text = StrTemplate(GetQueryTextAdvancesOnMoneyMovements(), RegisterName, AdvancesTableName);
	Query.SetParameter("Period", New Boundary(Parameters.RecorderPointInTime, BoundaryType.Excluding));
		
	QueryResult = Query.Execute();
	TransactionsBalanceTable = QueryResult.Unload();
	
	FilterFields = 
		"Company,
		|Partner,
		|Agreement,
		|LegalName,
		|Currency,
		|TransactionDocument";
	TransactionsTable = PostingServer.GetQueryTableByName(TransactionsTableName, Parameters);	
	For Each Row In TransactionsTable Do
		Filter = New Structure(FilterFields);
		FillPropertyValues(Filter, Row);
		ArrayOfRows = TransactionsBalanceTable.FindRows(Filter);
		For Each ItemOfArray In ArrayOfRows Do
			If ItemOfArray.BalanceAmount < Row.Amount Then
				ItemOfArray.BalanceAmount = 0;
			Else
				ItemOfArray.BalanceAmount = ItemOfArray.BalanceAmount - Row.Amount;
			EndIf;
		EndDo;
	EndDo;

	DataLock = New DataLock();
	LockFields = AccumulationRegisters.R5011B_CustomersAging.GetLockFields(TransactionsBalanceTable);
	DataLockItem = DataLock.Add(LockFields.RegisterName);
	DataLockItem.Mode = DataLockMode.Exclusive;
	DataLockItem.DataSource = LockFields.LockInfo.Data;
	For Each Field In LockFields.LockInfo.Fields Do
		DataLockItem.UseFromDataSource(Field.Key, Field.Value);
	EndDo;
	If LockFields.LockInfo.Data.Count() Then
		DataLock.Lock();
		Parameters.Insert("R5011B_CustomersAging_OffsetOfAdvance_Lock", DataLock);
	EndIf;	

	Query.Text = 
	"SELECT
	|	TransactionsBalanceTable.Period,
	|	TransactionsBalanceTable.Company,
	|	TransactionsBalanceTable.Partner,
	|	TransactionsBalanceTable.LegalName,
	|	TransactionsBalanceTable.Currency,
	|	TransactionsBalanceTable.AdvancesDocument,
	|	TransactionsBalanceTable.Key,
	|	TransactionsBalanceTable.DocumentAmount,
	|	TransactionsBalanceTable.TransactionDocument,
	|	TransactionsBalanceTable.Agreement,
	|	TransactionsBalanceTable.BalanceAmount,
	|	TransactionsBalanceTable.Amount
	|INTO TransactionsBalanceTable
	|FROM
	|	&TransactionsBalanceTable AS TransactionsBalanceTable
	|;
	|
	|
	|////////////////////////////////////////////////////////////////////////////////
	|SELECT
	|	TransactionsBalanceTable.Period,
	|	TransactionsBalanceTable.Company,
	|	TransactionsBalanceTable.Partner,
	|	TransactionsBalanceTable.LegalName,
	|	TransactionsBalanceTable.Currency,
	|	TransactionsBalanceTable.AdvancesDocument,
	|	TransactionsBalanceTable.Key,
	|	TransactionsBalanceTable.DocumentAmount,
	|	TransactionsBalanceTable.TransactionDocument,
	|	TransactionsBalanceTable.Agreement,
	|	TransactionsBalanceTable.BalanceAmount AS BalanceAmount,
	|	ISNULL(AgingBalance.AmountBalance, 0) AS AgingBalanceAmount,
	|	CASE
	|		WHEN TransactionsBalanceTable.TransactionDocument.Date IS NULL
	|			THEN DATETIME(1, 1, 1)
	|		ELSE ISNULL(AgingBalance.PaymentDate, TransactionsBalanceTable.TransactionDocument.Date)
	|	END AS PriorityDate,
	|	TransactionsBalanceTable.Amount
	|FROM
	|	TransactionsBalanceTable AS TransactionsBalanceTable
	|		LEFT JOIN AccumulationRegister.R5011B_CustomersAging.Balance(&Period, (Company, Partner, Agreement, Invoice,
	|			Currency) IN
	|			(SELECT
	|				TransactionsBalanceTable.Company,
	|				TransactionsBalanceTable.Partner,
	|				TransactionsBalanceTable.Agreement,
	|				TransactionsBalanceTable.TransactionDocument,
	|				TransactionsBalanceTable.Currency
	|			FROM
	|				TransactionsBalanceTable AS TransactionsBalanceTable)) AS AgingBalance
	|		ON TransactionsBalanceTable.Company = AgingBalance.Company
	|		AND TransactionsBalanceTable.Partner = AgingBalance.Partner
	|		AND TransactionsBalanceTable.Agreement = AgingBalance.Agreement
	|		AND TransactionsBalanceTable.TransactionDocument = AgingBalance.Invoice
	|		AND TransactionsBalanceTable.Currency = AgingBalance.Currency
	|ORDER BY
	|	PriorityDate";
	Query.SetParameter("Period", New Boundary(Parameters.PointInTime, BoundaryType.Excluding));
	Query.SetParameter("TransactionsBalanceTable", TransactionsBalanceTable);
	
	AgingBalanceResult = Query.Execute();
	AgingBalanceTable = AgingBalanceResult.Unload();
		
	Query.Text = "DROP TransactionsBalanceTable";
	Query.Execute();	
		
	FilterFields = 
		"Period,
		|Company,
		|Partner,
		|LegalName,
		|Currency,
		|AdvancesDocument,
		|TransactionDocument,
		|Agreement,
		|DocumentAmount,
		|BalanceAmount,
		|Amount";
	
	For Each Row In TransactionsBalanceTable Do
		NeedWriteOff = Row.BalanceAmount;
		If NeedWriteOff = 0 Then
			Continue;
		EndIf;
		
		If ValueIsFilled(Row.TransactionDocument) And Row.TransactionDocument.IgnoreAdvances Then
			Continue;
		EndIf;
		
		Filter = New Structure(FilterFields);
		FillPropertyValues(Filter, Row);
		ArrayOfRows = AgingBalanceTable.FindRows(Filter);
		For Each ItemOfArray In ArrayOfRows Do
			If Not ItemOfArray.AgingBalanceAmount > 0 Then
				Continue;
			EndIf;
			CanWriteOff = Min(ItemOfArray.AgingBalanceAmount, NeedWriteOff);
			NeedWriteOff = NeedWriteOff - CanWriteOff;
			ItemOfArray.AgingBalanceAmount = ItemOfArray.AgingBalanceAmount - CanWriteOff;
			ItemOfArray.BalanceAmount = CanWriteOff;
			If NeedWriteOff = 0 Then
				Break;
			EndIf;
		EndDo;
	EndDo;
	
	OffsetOfAdvance = DistributeAgingTableOnMoneyMovement(AgingBalanceTable);
	PutAdvancesTableToTempTables(Query, OffsetOfAdvance, OffsetOfAdvanceTableName);	
EndProcedure	

Function GetQueryTextAdvancesOnMoneyMovements()
	Return
	"SELECT
	|	Advances.Period,
	|	Advances.Company,
	|	Advances.Partner,
	|	Advances.LegalName,
	|	Advances.Currency,
	|	Advances.AdvancesDocument,
	|	Advances.Key,
	|	SUM(Advances.DocumentAmount) AS DocumentAmount,
	|	Transactions.Basis AS TransactionDocument,
	|	Transactions.Basis AS Invoice,
	|	Transactions.Agreement,
	|	SUM(Transactions.AmountBalance) AS BalanceAmount,
	|	0 AS Amount
	|FROM
	|	AccumulationRegister.%1.Balance(&Period, (Company, Partner, LegalName, Currency,
	|		CurrencyMovementType) IN
	|		(SELECT
	|			Advances.Company,
	|			Advances.Partner,
	|			Advances.LegalName,
	|			Advances.Currency,
	|			VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
	|		FROM
	|			%2 AS Advances)) AS Transactions
	|		INNER JOIN %2 AS Advances
	|		ON Advances.Company = Transactions.Company
	|		AND Advances.Partner = Transactions.Partner
	|		AND Advances.LegalName = Transactions.LegalName
	|		AND Advances.Currency = Transactions.Currency
	|GROUP BY
	|	Advances.Period,
	|	Advances.Company,
	|	Advances.Partner,
	|	Advances.LegalName,
	|	Advances.Currency,
	|	Advances.AdvancesDocument,
	|	Advances.Key,
	|	Transactions.Basis,
	|	Transactions.Agreement
	|ORDER BY
	|	Advances.Period,
	|	Transactions.Basis.Date";
EndFunction

Function DistributeAgingTableOnMoneyMovement(AgingBalanceTable)
	OffsetOfAdvance = AgingBalanceTable.CopyColumns();
	AgingBalanceTable_Groupped = AgingBalanceTable.Copy();
	
	FilterFields = 
		"Period, 
		|Company,
		|Partner, 
		|LegalName, 
		|Currency, 
		|DocumentAmount, 
		|AdvancesDocument, 
		|Key,
		|Amount"; 
	AgingBalanceTable_Groupped.GroupBy(FilterFields);
	For Each Row In AgingBalanceTable_Groupped Do
		NeedWriteOff = Row.DocumentAmount;
		If NeedWriteOff = 0 Then
			Continue;
		EndIf;
		Filter = New Structure(FilterFields);
		FillPropertyValues(Filter, Row);
		ArrayOfRows = AgingBalanceTable.FindRows(Filter);
		
		For Each ItemOfArray In ArrayOfRows Do
			If Not ItemOfArray.BalanceAmount > 0 Then
				Continue;
			EndIf;
			
			If ValueIsFilled(ItemOfArray.TransactionDocument) And ItemOfArray.TransactionDocument.IgnoreAdvances Then
				Continue;
			EndIf;
			
			CanWriteOff = Min(ItemOfArray.BalanceAmount, NeedWriteOff);
			NeedWriteOff = NeedWriteOff - CanWriteOff;
			ItemOfArray.BalanceAmount = ItemOfArray.BalanceAmount - CanWriteOff;
			
			NewRow = OffsetOfAdvance.Add();
			FillPropertyValues(NewRow, Row);
			
			NewRow.Amount              = CanWriteOff;
			NewRow.Agreement           = ItemOfArray.Agreement;
			NewRow.AdvancesDocument    = ItemOfArray.AdvancesDocument;
			NewRow.TransactionDocument = ItemOfArray.TransactionDocument;
			If NeedWriteOff = 0 Then
				Break;
			EndIf;
		EndDo;
	EndDo;
	Return OffsetOfAdvance;
EndFunction

Procedure PutAdvancesTableToTempTables(Query, OffsetOfAdvance, OffsetOfAdvanceTableName)
	Query.Text = 
	"SELECT
	|	OffsetOfAdvance.Period,
	|	OffsetOfAdvance.Company,
	|	OffsetOfAdvance.Partner,
	|	OffsetOfAdvance.LegalName,
	|	OffsetOfAdvance.Currency,
	|	OffsetOfAdvance.TransactionDocument,
	|	OffsetOfAdvance.AdvancesDocument,
	|	OffsetOfAdvance.Agreement,
	|	OffsetOfAdvance.Amount AS Amount,
	|	OffsetOfAdvance.Key
	|INTO %1
	|FROM
	|	&OffsetOfAdvance AS OffsetOfAdvance";
	Query.Text = StrTemplate(Query.Text, OffsetOfAdvanceTableName);
	Query.SetParameter("OffsetOfAdvance", OffsetOfAdvance);
	Query.Execute();
EndProcedure	

Procedure PutAgingTableToTempTables(Query, OffsetOfAging)
	Query.Text =  
	"SELECT
	|	OffsetOfAging.Period,
	|	OffsetOfAging.Company,
	|	OffsetOfAging.Partner,
	|	OffsetOfAging.Agreement,
	|	OffsetOfAging.Invoice,
	|	OffsetOfAging.PaymentDate,
	|	OffsetOfAging.Currency,
	|	OffsetOfAging.Amount
	|INTO OffsetOfAging
	|FROM
	|	&OffsetOfAging AS OffsetOfAging";
	Query.SetParameter("OffsetOfAging", OffsetOfAging);
	Query.Execute();
EndProcedure

Procedure CheckCreditLimit(Ref, Cancel) Export
	Query = New Query();
	Query.Text = 
	"SELECT
	|	R2021B_CustomersTransactionsBalance.AmountBalance
	|FROM
	|	AccumulationRegister.R2021B_CustomersTransactions.Balance(&Period,
	|		CurrencyMovementType = VALUE(ChartOfCharacteristicTypes.CurrencyMovementType.SettlementCurrency)
	|	AND Partner = &Partner
	|	AND Agreement = &Agreement) AS R2021B_CustomersTransactionsBalance";
	Query.SetParameter("Period"    , New Boundary(Ref.PointInTime(), BoundaryType.Excluding));
	Query.SetParameter("Partner"   , Ref.Partner);
	Query.SetParameter("Agreement" , Ref.Agreement);
	
	QuerySelection = Query.Execute().Select();
	If QuerySelection.Next() Then
		
		CreditLimitAmount = Ref.Agreement.CreditLimitAmount;
		
		If (QuerySelection.AmountBalance + Ref.DocumentAmount)  > CreditLimitAmount Then
			Cancel = True;
			Message = StrTemplate(R().Error_085, 
				CreditLimitAmount, 
				CreditLimitAmount - QuerySelection.AmountBalance, 
				Ref.DocumentAmount,
				(QuerySelection.AmountBalance + Ref.DocumentAmount) - CreditLimitAmount,
				Ref.Currency);
			CommonFunctionsClientServer.ShowUsersMessage(Message);
		EndIf;
	EndIf;
EndProcedure

