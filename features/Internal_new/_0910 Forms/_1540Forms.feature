﻿#language: en
@tree
@Positive
@Forms

Feature: forms

Background:
	Given I launch TestClient opening script or connect the existing one
	
Scenario: _0154000 preparation
	* Constants
		When set True value to the constant
	* Load info
		When Create catalog Countries objects
		When Create catalog Companies objects (second company Ferron BP)
		When Create catalog Companies objects (own Second company)
		When Create catalog ExpenseAndRevenueTypes objects
		When Create catalog BusinessUnits objects
		When Create catalog Partners objects
		When Create catalog Partners objects (Kalipso)
		When Create catalog InterfaceGroups objects (Purchase and production,  Main information)
		When Create catalog ObjectStatuses objects
		When Create catalog ItemKeys objects
		When Create catalog ItemTypes objects
		When Create catalog Units objects
		When Create catalog Items objects
		When Create catalog PriceTypes objects
		When Create catalog Specifications objects
		When Create chart of characteristic types AddAttributeAndProperty objects
		When Create catalog AddAttributeAndPropertySets objects
		When Create catalog AddAttributeAndPropertyValues objects
		When Create catalog Currencies objects
		When Create catalog Companies objects (Main company)
		When Create catalog Stores objects
		When Create catalog Partners objects (Ferron BP)
		When Create catalog Partners objects (Kalipso)
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog PartnerSegments objects
		When Create catalog Agreements objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog TaxRates objects
		When Create catalog Taxes objects	
		When Create information register TaxSettings records
		When Create information register PricesByItemKeys records
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		When Create catalog CashAccounts objects
		When Create catalog ChequeBonds objects
		When Create catalog SerialLotNumbers objects
		When Create catalog PaymentTerminals objects
		When Create catalog RetailCustomers objects
		When Create catalog SerialLotNumbers objects
		When Create catalog PaymentTerminals objects
		When Create catalog RetailCustomers objects
		When Create catalog BankTerms objects
		When Create catalog SpecialOfferRules objects (Test)
		When Create catalog SpecialOfferTypes objects (Test)
		When Create catalog SpecialOffers objects (Test)
		When Create catalog CashStatementStatuses objects (Test)
		When Create catalog Hardware objects  (Test)
		When Create catalog Workstations objects  (Test)
		When Create catalog ItemSegments objects
		When Create catalog PaymentTypes objects
	* Add plugin for taxes calculation
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "TaxCalculateVAT_TR" |
			When add Plugin for tax calculation
		When Create information register Taxes records (VAT)
	* Tax settings
		When filling in Tax settings for company


Scenario: _0154008 check autofilling the Partner term field in Purchase order
	When create a test partner with one vendor partner term and one customer partner term
	Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by vendor) in the documents of purchase/returns 
	And I close all client application windows

Scenario: _0154009 check autofilling the Partner term field in Purchase invoice
	Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by vendor) in the documents of purchase/returns 
	And I close all client application windows

Scenario: _0154010 check autofilling the Partner term field in Purchase return
	Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by vendor) in the documents of purchase/returns 
	And I close all client application windows

Scenario: _0154011  check autofilling the Partner term field in Purchase return order
	Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by vendor) in the documents of purchase/returns 
	And I close all client application windows


Scenario: _0154012 check autofilling the Partner term field in Sales order
	Given I open hyperlink "e1cib/list/Document.SalesOrder"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by customer) in the documents of sales/returns 
	And I close all client application windows

Scenario: _0154013 check autofilling the Partner term field in Sales invoice
	Given I open hyperlink "e1cib/list/Document.SalesInvoice"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by customer) in the documents of sales/returns 
	And I close all client application windows

Scenario: _0154014 check autofilling the Partner term field in Sales return order
	Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by customer) in the documents of sales/returns 
	And I close all client application windows

Scenario: _0154015 check autofilling the Partner term field in Sales return
	Given I open hyperlink "e1cib/list/Document.SalesReturn"
	And I click the button named "FormCreate"
	When check the autocompletion of the partner term (by customer) in the documents of sales/returns 
	And I close all client application windows

Scenario: _0154016 check autofilling item key in Sales order by item only with one item key
	Given I open hyperlink "e1cib/list/Document.SalesOrder"
	And I click the button named "FormCreate"
	When check item key autofilling in sales/returns documents for an item that has only one item key

Scenario: _0154017 check autofilling item key in Sales invoice by item only with one item key
	Given I open hyperlink "e1cib/list/Document.SalesInvoice"
	And I click the button named "FormCreate"
	When check item key autofilling in sales/returns documents for an item that has only one item key

Scenario: _0154018 check autofilling item key in Sales return order by item only with one item key
	Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
	And I click the button named "FormCreate"
	When check item key autofilling in sales/returns documents for an item that has only one item key

Scenario: _0154019 check autofilling item key in Sales return by item only with one item key
	Given I open hyperlink "e1cib/list/Document.SalesReturn"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154020 check autofilling item key in Shipment Confirmation by item only with one item key
	Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154021 check autofilling item key in GoodsReceipt by item only with one item key
	Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154022 check autofilling item key in Purchase order by item only with one item key
	Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154023 check autofilling item key in Purchase invoice by item only with one item key
	Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154024 check autofilling item key in Purchase return by item only with one item key
	Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154025 check autofilling item key in Purchase return order by item only with one item key
	Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key


Scenario: _0154026 check autofilling item key in Bundling by item only with one item key
	Given I open hyperlink "e1cib/list/Document.Bundling"
	And I click the button named "FormCreate"
	When check item key autofilling in bundling/transfer documents for an item that has only one item key

Scenario: _0154027 check autofilling item key in Unbundling by item only with one item key
	Given I open hyperlink "e1cib/list/Document.Unbundling"
	And I click the button named "FormCreate"
	When check item key autofilling in bundling/transfer documents for an item that has only one item key



Scenario: _0154030 check autofilling item key in Inventory transfer by item only with one item key 
	Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key

Scenario: _0154031 check autofilling item key in Inventory transfer order by item only with one item key 
	Given I open hyperlink "e1cib/list/Document.InventoryTransferOrder"
	And I click the button named "FormCreate"
	When check item key autofilling in bundling/transfer documents for an item that has only one item key

Scenario: _0154032 check autofilling item key in Internal Supply Request only with one item key 
	Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
	And I click the button named "FormCreate"
	When check item key autofilling in purchase/returns/goods receipt/shipment confirmation documents for an item that has only one item key




Scenario: _0154033 check if the Partner form contains an option to include a partner in the segment
	Given I open hyperlink "e1cib/list/Catalog.Partners"
	* Select partner
		And I click "List" button		
		And I go to line in "List" table
			| Description |
			| Seven Brand |
		And I select current line in "List" table
	* Add a test partner to the Dealer segment
		And In this window I click command interface button "Partner segments content"
		And "List" table does not contain lines
		| Segment | Partner     |
		| Dealer  | Seven Brand |
		And I click the button named "FormCreate"
		And I click Select button of "Segment" field
		And I go to line in "List" table
			| Description |
			| Dealer      |
		And I select current line in "List" table
		And I click "Save and close" button
	* Add a test partner to the Retail segment
		And I go to line in "List" table
			| Partner     | Segment |
			| Seven Brand | Retail  |
		And I go to line in "List" table
			| Partner     | Segment |
			| Seven Brand | Dealer  |
	* Delete added record
		And I delete a line in "List" table
		Then "1C:Enterprise" window is opened
		And I click "Yes" button
	And I close all client application windows


Scenario: _0154034 check item key selection in the form of item key
	* Open the item key selection form from the Sales order document.
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| Description |
			| Partner Kalipso     |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| Description |
			| Dress       |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
	* Check the selection by properties
	# Single item key + item key specifications that contain this property should be displayed
		And I select from "Color" drop-down list by "yellow" string
		And I click Select button of "Color" field
		And I go to line in "List" table
			| Additional attribute | Description |
			| Color         | Yellow      |
		And I select current line in "List" table
		And "List" table became equal
			| Item key  | Item  |
			| S/Yellow  | Dress |
			| Dress/A-8 | Dress |
	* Check the filter by single item key and by specifications
		And I change "IsSpecificationFilter" radio button value to "Single"
		And "List" table became equal
			| Item key  | Item  |
			| S/Yellow  | Dress |
		And I change "IsSpecificationFilter" radio button value to "Specification"
		And "List" table became equal
			| Item key  | Item  |
			| Dress/A-8 | Dress |
		And I change "IsSpecificationFilter" radio button value to "All"
		And "List" table became equal
			| Item key  | Item  |
			| S/Yellow  | Dress |
			| Dress/A-8 | Dress |
	And I close all client application windows


Scenario: _0154035 search the item key selection list
	* Open the Sales order creation form
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click "Create" button
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
	* General search check including All/Single/Specification switch selection
		And I input "s" text in "SearchString" field
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'M/White'   | 'Dress' |
		| 'L/Green'   | 'Dress' |
		| 'XL/Green'  | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
		And I click Clear button of "SearchString" field
		And I change "IsSpecificationFilter" radio button value to "Single"
		And I input "gr" text in "SearchString" field
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'S/Yellow'  | 'Dress' |
		| 'XS/Blue'   | 'Dress' |
		| 'M/White'   | 'Dress' |
		| 'Dress/A-8' | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
		And I click Clear button of "SearchString" field
		And I change "IsSpecificationFilter" radio button value to "Specification"
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'S/Yellow'  | 'Dress' |
		| 'XS/Blue'   | 'Dress' |
		| 'M/White'   | 'Dress' |
		| 'L/Green'   | 'Dress' |
		| 'XL/Green'  | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
		And I click Clear button of "SearchString" field
		And I change "IsSpecificationFilter" radio button value to "All"
		And I select from "Size" drop-down list by "s" string
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'XS/Blue'   | 'Dress' |
		| 'M/White'   | 'Dress' |
		| 'L/Green'   | 'Dress' |
		| 'XL/Green'  | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
	* Check search by properties
		And I click Clear button of "Size" field
		And I select from "Color" drop-down list by "gr" string
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'S/Yellow'  | 'Dress' |
		| 'XS/Blue'   | 'Dress' |
		| 'M/White'   | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
		And I change "IsSpecificationFilter" radio button value to "Single"
		And I select from "Color" drop-down list by "gr" string
		And "List" table does not contain lines
		| 'Item key'  | 'Item'  |
		| 'S/Yellow'  | 'Dress' |
		| 'XS/Blue'   | 'Dress' |
		| 'M/White'   | 'Dress' |
		| 'Dress/A-8' | 'Dress' |
		| 'XXL/Red'   | 'Dress' |
		| 'M/Brown'   | 'Dress' |
		And I change "IsSpecificationFilter" radio button value to "Specification"
		And I select from "Color" drop-down list by "Black" string
		Then the number of "List" table lines is "равно" 0
		And I close all client application windows


Scenario: _0154036 check the Deleting of the store field value by line with the service in a document Sales order
	* Open a creation form Sales Order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Service
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Service'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Service' | 'Rent'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | 'Store 01' |
	* Deleting of the store field value by line with the service
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field has been cleared
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | ''         |
		And I close all client application windows

Scenario: _0154037 check impossibility deleting of the store field by line with the product in a Sales order
	* Open a creation form Sales Order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows
	
Scenario: _0154038 check the Deleting of the store field value by line with the service in a document Sales invoice
	* Open a creation form Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Service
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Service'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Service' | 'Rent'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | 'Store 01' |
	* Deleting of the store field value by line with the service
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field has been cleared
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | ''         |
		And I close all client application windows

Scenario: _0154039 check impossibility deleting of the store field by line with the product in a Sales invoice
	* Open a creation form Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows
	
Scenario: _0154040 check the Deleting of the store field value by line with the service in a document Purchase order
	* Open a creation form Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Service
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Service'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Service' | 'Rent'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | 'Store 01' |
	* Deleting of the store field value by line with the service
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field has been cleared
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | ''         |
		And I close all client application windows

Scenario: _0154041 check impossibility deleting of the store field by line with the product in a Purchase Order
	* Open a creation form Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows
		
Scenario: _0154042 check the Deleting of the store field value by line with the service in a document Purchase invoice
	* Open a creation form Purchase invoice
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Service
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Service'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Service' | 'Rent'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | 'Store 01' |
	* Deleting of the store field value by line with the service
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field has been cleared
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  | 'Q'     | 'Store'    |
		| 'Service'  | 'Rent'      | '1,000' | ''         |
		And I close all client application windows

Scenario: _0154043 check impossibility deleting of the store field by line with the product in a Purchase invoice
	* Open a creation form Purchase invoice
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows

Scenario: _0154044 check impossibility deleting of the store field by line with the product in a Sales return order
	* Open a creation form Sales Return Order
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows

Scenario: _0154045 check impossibility deleting of the store field by line with the product in a Sales return
	* Open a creation form Sales Return
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows

Scenario: _0154046 check impossibility deleting of the store field by line with the product in a Purchase return
	* Open a creation form Purchase Return
		Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows
	
Scenario: _0154047 check impossibility deleting of the store field by line with the product in a Purchase return order
	* Open a creation form Purchase Return order
		Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 01'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "1,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Q'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 01' |
		And I close all client application windows

Scenario: _0154048 check impossibility deleting of the store field by line with the product in a Goods receipt
	* Open a creation form Goods receipt
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And Delay 2
		And I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "1,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Quantity'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 02' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Quantity'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 02' |
		And I close all client application windows

Scenario: _0154049 check impossibility deleting of the store field by line with the product in a  ShipmentConfirmation
	* Open a creation form ShipmentConfirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I click the button named "FormCreate"
	* Add to the table part of the product with the item type - Product
		And I click Choice button of the field named "Store"
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Dress'     |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'    | 'Item key' |
			| 'Dress'   | 'M/White'     |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "1,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Quantity'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 02' |
	* Delete store field by product line 
		And I activate field named "ItemListStore" in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Store" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
	* Check that the store field is still filled
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'     | 'Quantity'     | 'Store'    |
		| 'Dress'    | 'M/White'      | '1,000' | 'Store 02' |
		And I close all client application windows
			
		
		
Scenario: _0154050 check item and item key input by search in line in a document Sales order (in english)
	And I close all client application windows
	* Open a creation form Sales order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows
	

Scenario: _0154051 check item and item key input by search in line in a document Sales invoice (in english)
	And I close all client application windows
	* Open a creation form Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154052 check item and item key input by search in line in a document Sales return order (in english)
	And I close all client application windows
	* Open a creation form Sales return order
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154053 check item and item key input by search in line in a document Sales return (in english)
	And I close all client application windows
	* Open a creation form Sales return 
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click the button named "Add"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154054 check item and item key input by search in line in a document Purchase invoice (in english)
	And I close all client application windows
	* Open a creation form Purchase invoice
		Given I open hyperlink "e1cib/list/Document.Purchaseinvoice"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click the button named "Add"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154055 check item and item key input by search in line in a document Purchase order (in english)
	And I close all client application windows
	* Open a creation form Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click the button named "Add"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154056 check item and item key input by search in line in a document Goods Receipt (in english)
	And I close all client application windows
	* Open a creation form Goods Receipt
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154057 check item and item key input by search in line in a document Shipment confirmation (in english)
	And I close all client application windows
	* Open a creation form Shipment confirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click the button named "Add"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154058 check item and item key input by search in line in a document InternalSupplyRequest (in english)
	And I close all client application windows
	* Open a creation form Internal Supply Request
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154059 check item and item key input by search in line in a document InventoryTransferOrder (in english)
	And I close all client application windows
	* Open a creation form Inventory Transfer Order
		Given I open hyperlink "e1cib/list/Document.InventoryTransferOrder"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154060 check item and item key input by search in line in a document InventoryTransfer (in english)
	And I close all client application windows
	* Open a creation form Inventory Transfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154061 check item and item key input by search in line in a document Bundling (in english)
	And I close all client application windows
	* Open a creation form Bundling
		Given I open hyperlink "e1cib/list/Document.Bundling"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154062 check item and item key input by search in line in a document UnBundling (in english)
	And I close all client application windows
	* Open a creation form UnBundling
		Given I open hyperlink "e1cib/list/Document.Unbundling"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows


Scenario: _015406401 check item and item key input by search in line in a document StockAdjustmentAsSurplus (in english)
	And I close all client application windows
	* Open a creation form StockAdjustmentAsSurplus
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsSurplus"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _015406402 check item and item key input by search in line in a document StockAdjustmentAsWriteOff (in english)
	And I close all client application windows
	* Open a creation form StockAdjustmentAsWriteOff
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsWriteOff"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _015406403 check item and item key input by search in line in a document PhysicalInventory (in english)
	And I close all client application windows
	* Open a creation form PhysicalInventory
		Given I open hyperlink "e1cib/list/Document.PhysicalInventory"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _015406404 check item and item key input by search in line in a document PhysicalCountByLocation (in english)
	And I close all client application windows
	* Open a creation form PhysicalCountByLocation
		Given I open hyperlink "e1cib/list/Document.PhysicalCountByLocation"
		And I click the button named "FormCreate"
	* Item and item key input by search in line
		And I click "Add" button
		And I select "boo" from "Item" drop-down list by string in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select "36" from "Item key" drop-down list by string in "ItemList" table
	* Check entered values
		And "ItemList" table contains lines
		| 'Item'     | 'Item key'  |
		| 'Boots'    | '36/18SD' |
		And I close all client application windows

Scenario: _0154065 check item, item key and properties input by search in line in a document Price list (in english)
	And I close all client application windows
	* Open a creation form Price List
		Given I open hyperlink "e1cib/list/Document.PriceList"
		And I click the button named "FormCreate"
		And I change "Set price" radio button value to "By Item keys"
	* Item and item key input by search in line
		And I click the button named "ItemKeyListAdd"
		And I select "tr" from "Item" drop-down list by string in "ItemKeyList" table
		And I activate "Item key" field in "ItemKeyList" table
		And I select "36" from "Item key" drop-down list by string in "ItemKeyList" table
	* Check entered values
		And "ItemKeyList" table contains lines
		| 'Item'        | 'Item key'  |
		| 'Trousers'    | '36/Yellow' |

	

Scenario: _0154066 check partner, legal name, Partner term, company and store input by search in line in a document Sales order (in english)
	And I close all client application windows
	* Open a creation form Sales order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Basic Partner terms, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154066 check partner, legal name, company, currency input by search in line in a document Reconcilation statement (in english)
	And I close all client application windows
	* Open a creation form Reconciliation Statement
		Given I open hyperlink "e1cib/list/Document.ReconciliationStatement"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Currency input by search in line
		And I select from the drop-down list named "Currency" by "t" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Currency" became equal to "TRY"
	And I close all client application windows

Scenario: _0154067 check partner, legal name, Partner term, company and store input by search in line in a document Sales invoice (in english)
	And I close all client application windows
	* Open a creation form Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Basic Partner terms, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154068 check partner, legal name, Partner term, company and store input by search in line in a document Sales return (in english)
	And I close all client application windows
	* Open a creation form Sales return
		Given I open hyperlink "e1cib/list/Document.SalesReturn"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Basic Partner terms, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154069 check partner, legal name, Partner term, company and store input by search in line in a document Sales return order (in english)
	And I close all client application windows
	* Open a creation form Sales return order
		Given I open hyperlink "e1cib/list/Document.SalesReturnOrder"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Basic Partner terms, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154070 check partner, legal name, Partner term, company and store input by search in line in a document Purchase order (in english)
	And I close all client application windows
	* Open a creation form Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Vendor Ferron, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154071 check partner, legal name, Partner term, company and store input by search in line in a document Purchase invoice (in english)
	And I close all client application windows
	* Open a creation form Purchase invoice
		Given I open hyperlink "e1cib/list/Document.PurchaseInvoice"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Vendor Ferron, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154072 check partner, legal name, Partner term, company and store input by search in line in a document Purchase return (in english)
	And I close all client application windows
	* Open a creation form Purchase return
		Given I open hyperlink "e1cib/list/Document.PurchaseReturn"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Vendor Ferron, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154073 check partner, legal name, Partner term, company and store input by search in line in a document Purchase return order (in english)
	And I close all client application windows
	* Open a creation form Purchase return order
		Given I open hyperlink "e1cib/list/Document.PurchaseReturnOrder"
		And I click the button named "FormCreate"
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Partner term input by search in line
		And I select from "Partner term" drop-down list by "TRY" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Agreement" became equal to "Vendor Ferron, TRY"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows

Scenario: _0154074 check partner, legal name, company, store input by search in line in a document Goods Receipt (in english)
	And I close all client application windows
	* Open a creation form Goods Receipt
		Given I open hyperlink "e1cib/list/Document.GoodsReceipt"
		And I click the button named "FormCreate"
		And I select "Purchase" exact value from "Transaction type" drop-down list
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "02" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 02"
	And I close all client application windows

Scenario: _0154075 check partner, legal name, company, store input by search in line in a document Shipment confirmation (in english)
	And I close all client application windows
	* Open a creation form Shipment confirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I click the button named "FormCreate"
		And I select "Sales" exact value from "Transaction type" drop-down list
	* Partner input by search in line
		And I select from "Partner" drop-down list by "fer" string
	* Legal name input by search in line
		And I select from "Legal name" drop-down list by "com" string
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "02" string
	* Check entered values
		Then the form attribute named "Partner" became equal to "Ferron BP"
		Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 02"
	And I close all client application windows

Scenario: _0154076 check company, store input by search in line in a document InternalSupplyRequest (in english)
	And I close all client application windows
	* Open a creation form InternalSupplyRequest
		Given I open hyperlink "e1cib/list/Document.InternalSupplyRequest"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
	And I close all client application windows



Scenario: _0154077 check partner, legal name, company, store input by search in line in a document InventoryTransferOrder (in english)
	And I close all client application windows
	* Open a creation form InventoryTransferOrder
		Given I open hyperlink "e1cib/list/Document.InventoryTransferOrder"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "StoreSender" by "01" string
		And I select from the drop-down list named "StoreReceiver" by "02" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "StoreSender" became equal to "Store 01"
		Then the form attribute named "StoreReceiver" became equal to "Store 02"
	And I close all client application windows


Scenario: _0154078 check company, store input by search in line in a InventoryTransfer (in english)
	And I close all client application windows
	* Open a creation form InventoryTransfer
		Given I open hyperlink "e1cib/list/Document.InventoryTransfer"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "StoreSender" by "01" string
		And I select from the drop-down list named "StoreReceiver" by "02" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "StoreSender" became equal to "Store 01"
		Then the form attribute named "StoreReceiver" became equal to "Store 02"
	And I close all client application windows



Scenario: _0154081 check company, store, item bundle input by search in line in a Bundling (in english)
	And I close all client application windows
	* Open a creation form Bundling
		Given I open hyperlink "e1cib/list/Document.Bundling"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Input by string Item bundle
		And I select from the drop-down list named "ItemBundle" by "Trousers" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
		Then the form attribute named "ItemBundle" became equal to "Trousers"
	And I close all client application windows

Scenario: _0154082 check company, store, item box input by search in line in a UnBundling (in english)
	And I close all client application windows
	* Open a creation form Unbundling
		Given I open hyperlink "e1cib/list/Document.Unbundling"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Store input by search in line
		And I select from the drop-down list named "Store" by "01" string
	* Item bundle input by search in line
		And I select from "Item bundle" drop-down list by "Trousers" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Store" became equal to "Store 01"
		Then the form attribute named "ItemBundle" became equal to "Trousers"
	And I close all client application windows

Scenario: _0154083 check company, Cash accounts, transaction type, currency, partner, payee, Partner term input by search in line in a Cash payment (in english)
	And I close all client application windows
	* Open a creation form Cash payment
		Given I open hyperlink "e1cib/list/Document.CashPayment"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Cash accounts input by search in line
		And I select from "Cash account" drop-down list by "3" string
	* Transaction type input by search in line
		And I select from "Transaction type" drop-down list by "vendor" string
	* Currency input by search in line
		And I select from the drop-down list named "Currency" by "T" string
	* Partner input by search in line
		And in the table "PaymentList" I click "Add" button
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
	* Payee input by search in line
		And I activate "Payee" field in "PaymentList" table
		And I select "co" from "Payee" drop-down list by string in "PaymentList" table
	* Partner term input by search in line
		And I activate "Partner term" field in "PaymentList" table
		And I select "tr" from "Partner term" drop-down list by string in "PaymentList" table
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "CashAccount" became equal to "Cash desk №3"
		Then the form attribute named "Description" became equal to "Click to enter description"
		Then the form attribute named "TransactionType" became equal to "Payment to the vendor"
		Then the form attribute named "Currency" became equal to "TRY"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payee'             | 'Partner term'             |
		| 'Ferron BP' | 'Company Ferron BP' | 'Basic Partner terms, TRY' |
	And I close all client application windows


Scenario: _0154084 check company, Cash/Bank accounts, transaction type, currency, partner, payee, Partner term input by search in line in a Bank payment (in english)
	And I close all client application windows
	* Open a creation form Bank payment
		Given I open hyperlink "e1cib/list/Document.BankPayment"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Cash/Bank accounts input by search in line
		And I select from "Account" drop-down list by "usd" string
	* Transaction type input by search in line
		And I select from "Transaction type" drop-down list by "vendor" string
	* Currency input by search in line
		And I select from the drop-down list named "Currency" by "dol" string
	* Partner input by search in line
		And in the table "PaymentList" I click "Add" button
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
	* Payee input by search in line
		And I activate "Payee" field in "PaymentList" table
		And I select "co" from "Payee" drop-down list by string in "PaymentList" table
	* Partner term input by search in line
		And I activate "Partner term" field in "PaymentList" table
		And I select "tr" from "Partner term" drop-down list by string in "PaymentList" table
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Bank account, USD"
		Then the form attribute named "Description" became equal to "Click to enter description"
		Then the form attribute named "TransactionType" became equal to "Payment to the vendor"
		Then the form attribute named "Currency" became equal to "USD"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payee'             | 'Partner term'             |
		| 'Ferron BP' | 'Company Ferron BP' | 'Basic Partner terms, TRY' |
	And I close all client application windows

Scenario: _0154085 check company, Cash/Bank accounts, transaction type, currency, partner, payee, input by search in line in a Bank receipt (in english)
	And I close all client application windows
	* Open a creation form Bank receipt
		Given I open hyperlink "e1cib/list/Document.BankReceipt"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Cash/Bank accounts input by search in line
		And I select from "Account" drop-down list by "usd" string
	* Transaction type input by search in line
		And I select from "Transaction type" drop-down list by "customer" string
	* Currency input by search in line
		And I select from the drop-down list named "Currency" by "dol" string
	* Partner input by search in line
		And in the table "PaymentList" I click "Add" button
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
	* Payee input by search in line
		And I activate "Payer" field in "PaymentList" table
		And I select "co" from "Payer" drop-down list by string in "PaymentList" table
	* Partner term input by search in line
		And I activate "Partner term" field in "PaymentList" table
		And I select "usd" from "Partner term" drop-down list by string in "PaymentList" table
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Bank account, USD"
		Then the form attribute named "Description" became equal to "Click to enter description"
		Then the form attribute named "TransactionType" became equal to "Payment from customer"
		Then the form attribute named "Currency" became equal to "USD"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payer'              | 'Partner term' |
		| 'Ferron BP' | 'Company Ferron BP' | 'Ferron, USD' |
	And I close all client application windows

Scenario: _0154086 check company, Cash accounts, transaction type, currency, partner, payee, input by search in line in a Cash receipt (in english)
	And I close all client application windows
	* Open a creation form Cash receipt
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Cash/Bank accounts input by search in line
		And I select from "Cash account" drop-down list by "3" string
	* Transaction type input by search in line
		And I select from "Transaction type" drop-down list by "customer" string
	* Currency input by search in line
		And I select from the drop-down list named "Currency" by "dol" string
	* Partner input by search in line
		And in the table "PaymentList" I click "Add" button
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
	* Payee input by search in line
		And I activate "Payer" field in "PaymentList" table
		And I select "co" from "Payer" drop-down list by string in "PaymentList" table
	* Partner term input by search in line
		And I activate "Partner term" field in "PaymentList" table
		And I select "usd" from "Partner term" drop-down list by string in "PaymentList" table
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "CashAccount" became equal to "Cash desk №3"
		Then the form attribute named "Description" became equal to "Click to enter description"
		Then the form attribute named "TransactionType" became equal to "Payment from customer"
		Then the form attribute named "Currency" became equal to "USD"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payer'              | 'Partner term' |
		| 'Ferron BP' | 'Company Ferron BP' | 'Ferron, USD' |
	And I close all client application windows




Scenario: _0154087 check company, sender, receiver, send currency, receive currency, cash advance holder input by search in line in a Cash Transfer Order (in english)
	And I close all client application windows
	* Open a creation form Cash Transfer Order
		Given I open hyperlink "e1cib/list/Document.CashTransferOrder"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Sender input by search in line
		And I select from "Sender" drop-down list by "3" string
	* Input by string Receiver
		And I select from "Receiver" drop-down list by "1" string
	* Currency input by search in line
		And I select from "Send currency" drop-down list by "dol" string
		And I select from "Receive currency" drop-down list by "EUR" string
	* Cash advance holder input by search in line
		And I select from "Cash advance holder" drop-down list by "ari" string
	* Check entered values
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Sender" became equal to "Cash desk №3"
		Then the form attribute named "SendCurrency" became equal to "USD"
		Then the form attribute named "CashAdvanceHolder" became equal to "Arina Brown"
		Then the form attribute named "Receiver" became equal to "Cash desk №1"
		Then the form attribute named "ReceiveCurrency" became equal to "EUR"
		And I close all client application windows

Scenario: _0154088 check company, operation type, partner, legal name, Partner term, business unit, expence type input by search in line in a CreditNote (in english)
	And I close all client application windows
	* Open a creation form CreditNote
		Given I open hyperlink "e1cib/list/Document.CreditNote"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Filling the tabular part by searching the value by line
		And in the table "Transactions" I click "Add" button
		And I activate "Partner" field in "Transactions" table
		And I select "fer" from "Partner" drop-down list by string in "Transactions" table
		And I select "Company Ferr" from "Legal name" drop-down list by string in "Transactions" table
		And I activate "Partner term" field in "Transactions" table
		And I select "without" from "Partner term" drop-down list by string in "Transactions" table
		And I select "lir" from "Currency" drop-down list by string in "Transactions" table
		And I activate "Business unit" field in "Transactions" table
		And I select current line in "Transactions" table
		And I select "lo" from "Business unit" drop-down list by string in "Transactions" table
		And I activate "Expense type" field in "Transactions" table
		And I select "fu" from "Expense type" drop-down list by string in "Transactions" table
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		// Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		And "Transactions" table contains lines
		| 'Legal name'          | 'Partner'   | 'Partner term'                     | 'Business unit'        | 'Currency' | 'Expense type' |
		| 'Company Ferron BP'   | 'Ferron BP' | 'Basic Partner terms, without VAT' | 'Logistics department' | 'TRY'      | 'Fuel'         |
		And I close all client application windows


Scenario: _0154100 check company, operation type, partner, legal name, Partner term, business unit, expence type input by search in line in a DebitNote (in english)
	And I close all client application windows
	* Open a creation form DebitNote
		Given I open hyperlink "e1cib/list/Document.DebitNote"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Filling the tabular part by searching the value by line
		And in the table "Transactions" I click "Add" button
		And I activate "Partner" field in "Transactions" table
		And I select "fer" from "Partner" drop-down list by string in "Transactions" table
		And I select "Company Ferr" from "Legal name" drop-down list by string in "Transactions" table
		And I activate "Partner term" field in "Transactions" table
		And I select "without" from "Partner term" drop-down list by string in "Transactions" table
		And I select "lir" from "Currency" drop-down list by string in "Transactions" table
		And I activate "Business unit" field in "Transactions" table
		And I select current line in "Transactions" table
		And I select "lo" from "Business unit" drop-down list by string in "Transactions" table
		And I activate "Revenue type" field in "Transactions" table
		And I select "fu" from "Revenue type" drop-down list by string in "Transactions" table
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		// Then the form attribute named "LegalName" became equal to "Company Ferron BP"
		And "Transactions" table contains lines
		| 'Legal name'          | 'Partner'   | 'Partner term'                     | 'Business unit'        | 'Currency' | 'Revenue type' |
		| 'Company Ferron BP'   | 'Ferron BP' | 'Basic Partner terms, without VAT' | 'Logistics department' | 'TRY'      | 'Fuel'         |
		And I close all client application windows



Scenario: _0154089 check company, account, currency input by search in line in Incoming payment order (in english)
	And I close all client application windows
	* Open a creation form IncomingPaymentOrder
		Given I open hyperlink "e1cib/list/Document.IncomingPaymentOrder"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Input by string Account
		And I select from "Account" drop-down list by "2" string
	* Currency input by search in line
		And I select from "Currency" drop-down list by "dol" string
	* Filling the tabular part by searching the value by line
		And in the table "PaymentList" I click the button named "PaymentListAdd"
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
		And I activate "Payer" field in "PaymentList" table
		And I select "Second Company F" from "Payer" drop-down list by string in "PaymentList" table
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Cash desk №2"
		Then the form attribute named "Currency" became equal to "USD"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payer'                    |
		| 'Ferron BP' | 'Second Company Ferron BP' |
		And I close all client application windows

Scenario: _0154090 check company, account, currency input by search in line in Outgoing payment order (in english)
	And I close all client application windows
	* Open a creation form OutgoingPaymentOrder
		Given I open hyperlink "e1cib/list/Document.OutgoingPaymentOrder"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Input by string Account
		And I select from "Account" drop-down list by "2" string
	* Currency input by search in line
		And I select from "Currency" drop-down list by "dol" string
	* Filling the tabular part by searching the value by line
		And in the table "PaymentList" I click the button named "PaymentListAdd"
		And I select "fer" from "Partner" drop-down list by string in "PaymentList" table
		And I activate "Payee" field in "PaymentList" table
		And I select "Second Company F" from "Payee" drop-down list by string in "PaymentList" table
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Cash desk №2"
		Then the form attribute named "Currency" became equal to "USD"
		And "PaymentList" table contains lines
		| 'Partner'   | 'Payee'                    |
		| 'Ferron BP' | 'Second Company Ferron BP' |
		And I close all client application windows


Scenario: _0154091 check company, account, currency input by search in line in ChequeBondTransaction (in english)
	And I close all client application windows
	* Open a creation form ChequeBondTransaction
		Given I open hyperlink "e1cib/list/Document.ChequeBondTransaction"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Currency input by search in line
		And I select from "Currency" drop-down list by "lir" string
	* Filling the tabular part by searching the value by line (partner and legal name)
		And in the table "ChequeBonds" I click the button named "ChequeBondsAdd"
		And I activate "Partner" field in "ChequeBonds" table
		And I select "fer" from "Partner" drop-down list by string in "ChequeBonds" table
		And I select "se" from "Legal name" drop-down list by string in "ChequeBonds" table
	* Check filling in
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Currency" became equal to "TRY"
		And "ChequeBonds" table contains lines
		| 'Legal name'               | 'Partner'   |
		| 'Second Company Ferron BP' | 'Ferron BP' |
		And I close all client application windows


Scenario: _0154092 check store, responsible person input by search in line in PhysicalCountByLocation (in english)
	And I close all client application windows
	* Open a creation form PhysicalCountByLocation
		Given I open hyperlink "e1cib/list/Document.PhysicalCountByLocation"
		And I click the button named "FormCreate"
	* Store input by search in line
		And I select from "Store" drop-down list by "02" string
	* Responsible person input by search in line
		And I select from "Responsible person" drop-down list by "Anna" string
	* Check filling in
		Then the form attribute named "Store" became equal to "Store 02"
		Then the form attribute named "ResponsiblePerson" became equal to "Anna Petrova"
		And I close all client application windows


Scenario: _0154093 check store input by search in line in PhysicalInventory (in english)
	And I close all client application windows
	* Open a creation form PhysicalInventory
		Given I open hyperlink "e1cib/list/Document.PhysicalInventory"
		And I click the button named "FormCreate"
	* Store input by search in line
		And I select from "Store" drop-down list by "02" string
	* Check filling in
		Then the form attribute named "Store" became equal to "Store 02"
		And I close all client application windows


Scenario: _0154094 check store, company, tabular part input by search in line in StockAdjustmentAsWriteOff (in english)
	And I close all client application windows
	* Open a creation form StockAdjustmentAsWriteOff
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsWriteOff"
		And I click the button named "FormCreate"
	* Store input by search in line
		And I select from "Store" drop-down list by "02" string
	* Company input by search in line
		And I select from "Company" drop-down list by "Main" string
	* Check filling in
		Then the form attribute named "Store" became equal to "Store 02"
		Then the form attribute named "Company" became equal to "Main Company"
	* Business unit, expence type input by search in line
		And I click the button named "Add"
		And I activate "Business unit" field in "ItemList" table
		And I select "log" from "Business unit" drop-down list by string in "ItemList" table
		And I move to the next attribute
		And I activate "Expense type" field in "ItemList" table
		And I select "fu" from "Expense type" drop-down list by string in "ItemList" table
	* Check filling in
		And "ItemList" table contains lines
		| 'Business unit'        | 'Expense type' |
		| 'Logistics department' | 'Fuel'         |
		And I close all client application windows


Scenario: _0154095 check store, company, tabular part input by search in line in StockAdjustmentAsSurplus (in english)
	And I close all client application windows
	* Open a creation form StockAdjustmentAsSurplus
		Given I open hyperlink "e1cib/list/Document.StockAdjustmentAsSurplus"
		And I click the button named "FormCreate"
	* Store input by search in line
		And I select from "Store" drop-down list by "02" string
	* Company input by search in line
		And I select from "Company" drop-down list by "Main" string
	* Check filling in
		Then the form attribute named "Store" became equal to "Store 02"
		Then the form attribute named "Company" became equal to "Main Company"
	* Business unit, expence type input by search in line
		And I click the button named "Add"
		And I activate "Business unit" field in "ItemList" table
		And I select "log" from "Business unit" drop-down list by string in "ItemList" table
		And I move to the next attribute
		And I activate "Revenue type" field in "ItemList" table
		And I select "fu" from "Revenue type" drop-down list by string in "ItemList" table
	* Check filling in
		And "ItemList" table contains lines
		| 'Business unit'        | 'Revenue type' |
		| 'Logistics department' | 'Fuel'         |
		And I close all client application windows


Scenario: _0154096 check company, account, currency input by search in line in Opening Entry (in english)
	And I close all client application windows
	* Open a creation form OpeningEntry
		Given I open hyperlink "e1cib/list/Document.OpeningEntry"
		And I click the button named "FormCreate"
	* Company input by search in line
		And I select from "Company" drop-down list by "main" string
	* Filling the tabular part by searching the value by line Inventory
		And I move to "Inventory" tab
		And in the table "Inventory" I click the button named "InventoryAdd"
		And I select "dress" from "Item" drop-down list by string in "Inventory" table
		And I activate "Item key" field in "Inventory" table
		And I select "L" from "Item key" drop-down list by string in "Inventory" table
		And I activate "Store" field in "Inventory" table
		And I select "01" from "Store" drop-down list by string in "Inventory" table
		And I activate "Quantity" field in "Inventory" table
		And I input "2,000" text in "Quantity" field of "Inventory" table
	* Filling the tabular part by searching the value by line Account balance
		And I move to "Account balance" tab
		And in the table "AccountBalance" I click the button named "AccountBalanceAdd"
		And I select "№1" from "Account" drop-down list by string in "AccountBalance" table
		And I select "t" from "Currency" drop-down list by string in "AccountBalance" table
	* Filling the tabular part by searching the value by line Advance
		And I move to "Advance" tab
		And in the table "AdvanceFromCustomers" I click the button named "AdvanceFromCustomersAdd"
		And I select "fer" from "Partner" drop-down list by string in "AdvanceFromCustomers" table
		And I move to the next attribute
		And I activate field named "AdvanceFromCustomersLegalName" in "AdvanceFromCustomers" table
		And I select "se" from "Legal name" drop-down list by string in "AdvanceFromCustomers" table
		And I select "t" from "Currency" drop-down list by string in "AccountBalance" table
		And I move to "To suppliers" tab
		And in the table "AdvanceToSuppliers" I click the button named "AdvanceToSuppliersAdd"
		And I select "fer" from "Partner" drop-down list by string in "AdvanceToSuppliers" table
		And I move to the next attribute
		And I activate field named "AdvanceFromCustomersLegalName" in "AdvanceFromCustomers" table
		And I select "se" from "Legal name" drop-down list by string in "AdvanceToSuppliers" table
		And I select "t" from "Currency" drop-down list by string in "AdvanceToSuppliers" table
	* Filling the tabular part by searching the value by line Account payable
		* By Partner terms
			And I move to "Account payable" tab
			And in the table "AccountPayableByAgreements" I click the button named "AccountPayableByAgreementsAdd"
			And I select "fer" by string from the drop-down list named "AccountPayableByAgreementsPartner" in "AccountPayableByAgreements" table
			And I move to the next attribute
			And I select "sec" by string from the drop-down list named "AccountPayableByAgreementsLegalName" in "AccountPayableByAgreements" table
			And I select "usd" by string from the drop-down list named "AccountPayableByAgreementsAgreement" in "AccountPayableByAgreements" table
			And I select "t" by string from the drop-down list named "AccountPayableByAgreementsCurrency" in "AccountPayableByAgreements" table
		* By documents
			And I move to the tab named "GroupAccountPayableByDocuments"
			And in the table "AccountPayableByDocuments" I click the button named "AccountPayableByDocumentsAdd"
			And I select "fer" by string from the drop-down list named "AccountPayableByDocumentsPartner" in "AccountPayableByDocuments" table
			And I move to the next attribute
			And I select "s" by string from the drop-down list named "AccountPayableByDocumentsLegalName" in "AccountPayableByDocuments" table
			And I activate field named "AccountPayableByDocumentsAgreement" in "AccountPayableByDocuments" table
			And I select "ve" by string from the drop-down list named "AccountPayableByDocumentsAgreement" in "AccountPayableByDocuments" table
			And I select "t" by string from the drop-down list named "AccountPayableByDocumentsCurrency" in "AccountPayableByDocuments" table
			And I finish line editing in "AccountPayableByDocuments" table
	* Filling the tabular part by searching the value by line Account receivable
		* By Partner terms
			And I move to "Account receivable" tab
			And in the table "AccountReceivableByAgreements" I click the button named "AccountReceivableByAgreementsAdd"
			And I select "DF" by string from the drop-down list named "AccountReceivableByAgreementsPartner" in "AccountReceivableByAgreements" table
			And I move to the next attribute
			And I select "DF" by string from the drop-down list named "AccountReceivableByAgreementsLegalName" in "AccountReceivableByAgreements" table
			And I select "t" by string from the drop-down list named "AccountReceivableByAgreementsCurrency" in "AccountReceivableByAgreements" table
		* By documents
			And I move to the tab named "GroupAccountReceivableByDocuments"
			And in the table "AccountReceivableByDocuments" I click the button named "AccountReceivableByDocumentsAdd"
			And I select "DF" by string from the drop-down list named "AccountReceivableByDocumentsPartner" in "AccountReceivableByDocuments" table
			And I move to the next attribute
			And I select "DF" by string from the drop-down list named "AccountReceivableByDocumentsLegalName" in "AccountReceivableByDocuments" table
			And I select "t" by string from the drop-down list named "AccountReceivableByDocumentsCurrency" in "AccountReceivableByDocuments" table
			And I finish line editing in "AccountReceivableByDocuments" table
	* Filling check
		And Delay 2
		And "Inventory" table contains lines
		| 'Item'  | 'Quantity' | 'Item key' | 'Store'    |
		| 'Dress' | '2,000'    | 'L/Green' | 'Store 01' |
		And "AccountBalance" table contains lines
			| 'Account'      | 'Currency' |
			| 'Cash desk №1' | 'TRY'      |
		And "AdvanceFromCustomers" table contains lines
			| 'Partner'   | 'Legal name'               |
			| 'Ferron BP' | 'Second Company Ferron BP' |
		And "AdvanceToSuppliers" table contains lines
			| 'Partner'   | 'Legal name'               |
			| 'Ferron BP' | 'Second Company Ferron BP' |
		And "AccountPayableByAgreements" table contains lines
			| 'Partner'   | 'Partner term'          | 'Legal name'               | 'Currency' |
			| 'Ferron BP' | 'Vendor Ferron, USD' | 'Second Company Ferron BP' | 'TRY'      |
		And "AccountPayableByDocuments" table contains lines
			| 'Partner'   | 'Partner term'          | 'Legal name'               | 'Currency' |
			| 'Ferron BP' | 'Vendor Ferron, TRY' | 'Second Company Ferron BP' | 'TRY'      |
		And "AccountReceivableByAgreements" table contains lines
			| 'Partner' | 'Legal name' | 'Currency' |
			| 'DFC'     | 'DFC'        | 'TRY'      |
		And "AccountReceivableByDocuments" table contains lines
			| 'Partner' | 'Legal name' | 'Currency' |
			| 'DFC'     | 'DFC'        | 'TRY'      |
	And I close all client application windows

Scenario: _0154097 check company and account (in english) input by search in line in Cash revenue
	And I close all client application windows
	* Open a creation form Cash revenue
		Given I open hyperlink "e1cib/list/Document.CashRevenue"
		And I click the button named "FormCreate"
	* Company input by search in line and account
		And I select from "Company" drop-down list by "main" string
		And I select from "Account" drop-down list by "TRY" string
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Bank account, TRY"
	And I close all client application windows



Scenario: _0154098 check company and account (in english) input by search in line in CashExpense
	And I close all client application windows
	* Open a creation form CashExpense
		Given I open hyperlink "e1cib/list/Document.CashExpense"
		And I click the button named "FormCreate"
	* Company input by search in line and account
		And I select from "Company" drop-down list by "main" string
		And I select from "Account" drop-down list by "TRY" string
	* Filling check
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Account" became equal to "Bank account, TRY"
	And I close all client application windows

Scenario: _0154099 check partner and legal name (in english) input by search in line in Invoice Match
	And I close all client application windows
	* Open document form
		Given I open hyperlink "e1cib/list/Document.InvoiceMatch"
		And I click the button named "FormCreate"
	* Check the filter when typing by Partner/Legal name
		And in the table "Transactions" I click the button named "TransactionsAdd"
		And I select "MIO" by string from the drop-down list named "TransactionsPartner" in "Transactions" table
		And I select "Company Kalipso" by string from the drop-down list named "TransactionsLegalName" in "Transactions" table
	* Check that there is only one legal name available for selection
		And I click choice button of the attribute named "TransactionsLegalName" in "Transactions" table
		And "List" table became equal
		| 'Description' |
		| 'Company Kalipso'         |
		And I close all client application windows




Scenario: _010018 check the display on the Partners Description ENG form after changes (without re-open)
	And I close all client application windows
	* Open catalog Partners
		Given I open hyperlink "e1cib/list/Catalog.Partners"
	* Select Anna Petrova
		And I go to line in "List" table
			| 'Description' |
			| 'Anna Petrova'         |
		And I select current line in "List" table
	* Changing Description_en to Anna Petrova1 and display checking
		And I input "Anna Petrova1" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Anna Petrova1"
	* Changing Description_en back and display checking
		And I input "Anna Petrova" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Anna Petrova"
		And I click "Save and close" button

Scenario: _010019 check the display on the Company Description ENG form after changes (without re-open)
	And I close all client application windows
	* Open catalog Companies
		Given I open hyperlink "e1cib/list/Catalog.Companies"
	* Select Company Lomaniti
		And I go to line in "List" table
			| 'Description' |
			| 'Company Lomaniti'         |
		And I select current line in "List" table
	* Changing Description_en to Company Lomaniti1 and display checking
		And I input "Company Lomaniti1" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Company Lomaniti1"
		And I input "Company Lomaniti" text in the field named "Description_en"
		And I click "Save" button
	* Changing Description_en back and display checking
		Then the form attribute named "Description_en" became equal to "Company Lomaniti"
		And I click "Save and close" button


Scenario: _010017 check the move to the Company tab from the Partner (shows the partner's Legal name)
	And I close all client application windows
	* Open catalog Partners
		Given I open hyperlink "e1cib/list/Catalog.Partners"
	* Select Ferron BP
		And I go to line in "List" table
				| 'Description' |
				| 'Ferron BP' |
		And I select current line in "List" table
		And Delay 2
	* Check the move to the Company tab
		And In this window I click command interface button "Company"
		And "List" table became equal
			| 'Description'       |
			| 'Company Ferron BP' |
			| 'Second Company Ferron BP' |
		And I select current line in "List" table
		* Check the display of Company information
			Then the form attribute named "Country" became equal to "Turkey"
			Then the form attribute named "Partner" became equal to "Ferron BP"
			Then the form attribute named "Description_en" became equal to "Company Ferron BP"
		And I close current window
		And I close current window

Scenario: _005034 check filling in the required fields in the Items catalog
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Catalog.Items"
	When create a catalog element with the name Test
	If current window contains user messages Then
	And I close current window
	Then "1C:Enterprise" window is opened
	And I click "No" button


Scenario: _005035 check filling in the required fields in the AddAttributeAndPropertyValues catalog 
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Catalog.AddAttributeAndPropertyValues"
	When create a catalog element with the name Test
	If current window contains user messages Then
	And I close current window
	Then "1C:Enterprise" window is opened
	And I click "No" button



Scenario: _005037 check filling in the required fields in the Users catalog 
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Catalog.Users"
	When create a catalog element with the name Test
	And I close current window
	Then "1C:Enterprise" window is opened
	And I click "No" button


Scenario: _005118 check the display on the Items Description ENG form after changes (without re-open)
	And I close all client application windows
	* Open Item Box
		Given I open hyperlink "e1cib/list/Catalog.Items"
		And I go to line in "List" table
			| 'Description' |
			| 'Box'         |
		And I select current line in "List" table
	* Changing Description_en to Box1 and display checking
		And I input "Box1" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Box1"
		And I input "Box" text in the field named "Description_en"
		And I click "Save" button
	* Changing Description_en back
		Then the form attribute named "Description_en" became equal to "Box"
		And I click "Save and close" button

Scenario: _012008 check the display on the Partner term Description ENG form after changes (without re-open)
	And I close all client application windows
	* Open Personal Partner terms, $ (catalog Partner terms)  
		Given I open hyperlink "e1cib/list/Catalog.Agreements"
		And I go to line in "List" table
			| 'Description' |
			| 'Personal Partner terms, $'         |
		And I select current line in "List" table
	* Changing Description_en to Personal Partner terms, $ 1 and display checking
		And I input "Personal Partner terms, $ 1" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Personal Partner terms, $ 1"
	* Changing Description_en back
		And I input "Personal Partner terms, $" text in the field named "Description_en"
		And I click "Save" button
		Then the form attribute named "Description_en" became equal to "Personal Partner terms, $"
		And I click "Save and close" button

Scenario: _012009 check the move to Partner terms from the Partner card (shows available partner Partner terms)
	And I close all client application windows
	* Open Ferron BP (catalog Partners)
		Given I open hyperlink "e1cib/list/Catalog.Partners"
		And I go to line in "List" table
				| 'Description' |
				| 'Ferron BP' |
		And I select current line in "List" table
		And Delay 2
	* Moving to Partner terms
		And In this window I click command interface button "Partner terms"
	* Check the display of only available Partner terms
		And I save number of "List" table lines as "QS"
		Then "QS" variable is equal to 8
		And "List" table contains lines
			| Description                     |
			| Basic Partner terms, TRY         |
			| Basic Partner terms, $           |
			| Basic Partner terms, without VAT |
			| Vendor Ferron, TRY            |
			| Vendor Ferron, USD            |
			| Vendor Ferron, EUR            |
			| Sale autum, TRY               |
			| Ferron, USD               |
		And I close current window
	

Scenario: check the filter by Company and Legal name field when creating an Partner term
	And I close all client application windows
	* Open a creation form Partner term
		Given I open hyperlink "e1cib/list/Catalog.Agreements"
		And I click the button named "FormCreate"
	* Check the filter by Company
		And I click Select button of "Company" field
		And "List" table became equal
			| 'Description'              |
			| 'Main Company'             |
			| 'Second Company'           |
		And I select current line in "List" table
	* Check the filter by Legal name
		And I click Select button of "Legal name" field
		And "List" table does not contain lines
			| 'Description'              |
			| 'Main Company'             |
			| 'Second Company'           |
		And I go to line in "List" table
			| 'Description' |
			| 'Company Ferron BP' |
		And I select current line in "List" table
	* Check the filter by partners Legal name 
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And "List" table does not contain lines
		| 'Description'              |
		| 'Company Ferron BP'        |
		| 'DFC'                      |
		| 'Big foot'                 |
		| 'Second Company Ferron BP' |
		And I close all client application windows

Scenario: filter check by Partner segment when creating an Partner term
	And I close all client application windows
	* Open a creation form Partner term
		Given I open hyperlink "e1cib/list/Catalog.Agreements"
		And I click the button named "FormCreate"
		And I change "Type" radio button value to "Customer"
	* Check the filter by Partner segment
		And I click Select button of "Partner segment" field
		And "List" table contains lines
			| 'Description' |
			| 'Retail'      |
			| 'Dealer'      |
		And "List" table does not contain lines
			| 'Description' |
			| 'Region 1'    |
			| 'Region 2'    |
		And I close all client application windows
	

Scenario: inability to create your own company for Partner
	And I close all client application windows
	* Open Partner
		Given I open hyperlink "e1cib/list/Catalog.Partners"
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'   |
		And I select current line in "List" table
		And In this window I click command interface button "Company"
		And I click the button named "FormCreate"
	* Check that Our checkbox is not available
		If "Our" attribute is not editable Then

Scenario: check the selection of the segment manager in the sales order
	And I close all client application windows
	* Open the Sales order creation form
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Filling in Partner and Legal name
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I select current line in "List" table
		And I move to "Other" tab
		And I expand "More" group
		And I click Select button of "Manager segment" field
	* Check the display of manager segments
		And "List" table became equal
		| 'Description' |
		| 'Region 1'    |
		| 'Region 2'    |



Scenario: check row key when cloning a string in Sales order
	And I close all client application windows
	* Filling in the details of the documentsales order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'         |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'                   |
			| 'Basic Partner terms, without VAT' |
		And I select current line in "List" table
	* Filling in Sales order
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of the attribute named "ItemListItem" in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Trousers'    |
		And I select current line in "List" table
		And I activate field named "ItemListItemKey" in "ItemList" table
		And I click choice button of the attribute named "ItemListItemKey" in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Trousers' | '38/Yellow' |
		And I select current line in "List" table
		And I finish line editing in "ItemList" table
		And I activate field named "ItemListItem" in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListContextMenuCopy"
		And I finish line editing in "ItemList" table
		And I click the button named "FormPost"
	* Check that the row keys do not match
		And I click "Registrations report" button
		And I save spreadsheet document cell value "ResultTable" "R34C8" to "Rov1" variable
		And I save spreadsheet document cell value "ResultTable" "R35C8" to "Rov2" variable
		And I display "Rov1" variable value
		And I display "Rov2" variable value
		Given I open hyperlink "e1cib/list/AccumulationRegister.OrderBalance"
		And I go to line in "List" table
		| 'Row key' |
		| '$Rov1$'    |
		And I activate "Row key" field in "List" table
		And in the table "List" I click the button named "ListContextMenuFindByCurrentValue"
		Then the number of "List" table lines is "меньше или равно" 1

Scenario: check row key when cloning a string in Sales invoice
	And I close all client application windows
	* Filling in the details of the document Sales invoice
		Given I open hyperlink "e1cib/list/Document.SalesInvoice"
		And I click the button named "FormCreate"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso'         |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'                   |
			| 'Basic Partner terms, without VAT' |
		And I select current line in "List" table
	* Filling in Sales invoice
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of the attribute named "ItemListItem" in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Trousers'    |
		And I select current line in "List" table
		And I activate field named "ItemListItemKey" in "ItemList" table
		And I click choice button of the attribute named "ItemListItemKey" in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Trousers' | '38/Yellow' |
		And I select current line in "List" table
		And I finish line editing in "ItemList" table
		And I activate field named "ItemListItem" in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListContextMenuCopy"
		And I finish line editing in "ItemList" table
		And I click the button named "FormPost"
	* Check that the row keys do not match
		And I click "Registrations report" button
		And I save spreadsheet document cell value "ResultTable" "R19C8" to "Rov1" variable
		And I save spreadsheet document cell value "ResultTable" "R20C8" to "Rov2" variable
		And I display "Rov1" variable value
		And I display "Rov2" variable value
		Given I open hyperlink "e1cib/list/AccumulationRegister.GoodsInTransitOutgoing"
		And I go to line in "List" table
		| 'Row key' |
		| '$Rov1$'    |
		And I activate "Row key" field in "List" table
		And in the table "List" I click the button named "ListContextMenuFindByCurrentValue"
		Then the number of "List" table lines is "меньше или равно" 1

Scenario: check row key when cloning a string in Purchase order
	And I close all client application windows
	* Filling in the details of the document Purchase order
		Given I open hyperlink "e1cib/list/Document.PurchaseOrder"
		And I click the button named "FormCreate"
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description'   |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'        |
			| 'Vendor Ferron, TRY' |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I go to line in "List" table
			| 'Description'       |
			| 'Company Ferron BP' |
		And I select current line in "List" table
		And I select "Approved" exact value from "Status" drop-down list
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description'   |
			| 'Store 02'     |
		And I select current line in "List" table
	* Filling in Purchase order
		And I click the button named "Add"
		And I click choice button of the attribute named "ItemListItem" in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Trousers'    |
		And I select current line in "List" table
		And I activate field named "ItemListItemKey" in "ItemList" table
		And I click choice button of the attribute named "ItemListItemKey" in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Trousers' | '38/Yellow' |
		And I select current line in "List" table
		And I activate "Price" field in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I activate field named "ItemListItem" in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListContextMenuCopy"
		And I finish line editing in "ItemList" table
		And I click the button named "FormPost"
	* Check that the row keys do not match
		And I click "Registrations report" button
		And I save spreadsheet document cell value "ResultTable" "R6C9" to "Rov1" variable
		And I save spreadsheet document cell value "ResultTable" "R7C9" to "Rov2" variable
		And I display "Rov1" variable value
		And I display "Rov2" variable value
		Given I open hyperlink "e1cib/list/AccumulationRegister.GoodsReceiptSchedule"
		And I go to line in "List" table
		| 'Row key' |
		| '$Rov1$'    |
		And I activate "Row key" field in "List" table
		And in the table "List" I click the button named "ListContextMenuFindByCurrentValue"
		Then the number of "List" table lines is "меньше или равно" 1

Scenario: check row key when cloning a string in Shipment confirmation
	And I close all client application windows
	* Filling in the details of the document Shipment confirmation
		Given I open hyperlink "e1cib/list/Document.ShipmentConfirmation"
		And I click the button named "FormCreate"
		And I select "Sales" exact value from "Transaction type" drop-down list
		And I click Select button of "Store" field
		And I go to line in "List" table
			| 'Description' |
			| 'Store 02'    |
		And I select current line in "List" table
		And I click Select button of "Company" field
		And I go to line in "List" table
			| 'Description'  |
			| 'Main Company' |
		And I select current line in "List" table
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description'   |
			| 'Ferron BP'     |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I go to line in "List" table
			| 'Description'       |
			| 'Company Ferron BP' |
		And I select current line in "List" table
	* Filling in Shipment confirmation
		And I click the button named "Add"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Trousers'    |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Trousers' | '38/Yellow' |
		And I select current line in "List" table
		And I activate "Quantity" field in "ItemList" table
		And I input "1,000" text in "Quantity" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I activate field named "ItemListItem" in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListContextMenuCopy"
		And I finish line editing in "ItemList" table
		And I click the button named "FormPost"
	* Check that the row keys do not match
		And I click "Registrations report" button
		And I save spreadsheet document cell value "ResultTable" "R6C8" to "Rov1" variable
		And I save spreadsheet document cell value "ResultTable" "R7C8" to "Rov2" variable
		And I display "Rov1" variable value
		And I display "Rov2" variable value
		Given I open hyperlink "e1cib/list/AccumulationRegister.GoodsInTransitOutgoing"
		And I go to line in "List" table
		| 'Row key' |
		| '$Rov1$'    |
		And I activate "Row key" field in "List" table
		And in the table "List" I click the button named "ListContextMenuFindByCurrentValue"
		Then the number of "List" table lines is "меньше или равно" 1






Scenario: check filling in procurement method using the button Fill in SO
	And I close all client application windows
	* Open a creation form Sales order
		Given I open hyperlink "e1cib/list/Document.SalesOrder"
		And I click the button named "FormCreate"
	* Filling in the details
		And I click Select button of "Partner" field
		And I go to line in "List" table
			| 'Description' |
			| 'Ferron BP'   |
		And I select current line in "List" table
		And I click Select button of "Legal name" field
		And I go to line in "List" table
			| 'Description'       |
			| 'Company Ferron BP' |
		And I select current line in "List" table
		And I click Select button of "Partner term" field
		And I go to line in "List" table
			| 'Description'           |
			| 'Basic Partner terms, TRY' |
		And I select current line in "List" table
	* Adding items to Sales order (4 string)
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Shirt'       |
		And I select current line in "List" table
		And I finish line editing in "ItemList" table
		And I activate "Item key" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Shirt' | '38/Black' |
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "5,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Boots'       |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'  | 'Item key' |
			| 'Boots' | '38/18SD'  |
		And I activate "Item" field in "List" table
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "8,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'High shoes'  |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		Then "Item keys" window is opened
		And I go to line in "List" table
			| 'Item'       | 'Item key' |
			| 'High shoes' | '37/19SD'  |
		And I activate "Item" field in "List" table
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "2,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Trousers'    |
		And I select current line in "List" table
		And I activate "Item key" field in "ItemList" table
		And I click choice button of "Item key" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Trousers' | '38/Yellow' |
		And I activate "Item" field in "List" table
		And I select current line in "List" table
		And I activate "Q" field in "ItemList" table
		And I input "3,000" text in "Q" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Check the button
		And I go to line in "ItemList" table
			| 'Item'  | 'Item key' | 'Q'     |
			| 'Shirt' | '38/Black' | '5,000' |
		And I move one line down in "ItemList" table and select line
		And in the table "ItemList" I click "Procurement" button
		And I set checkbox "Stock"
		And I click "OK" button
		And I go to line in "ItemList" table
			| 'Item'       | 'Item key' | 'Q'     |
			| 'High shoes' | '37/19SD'  | '2,000' |
		And I move one line down in "ItemList" table and select line
		And in the table "ItemList" I click "Procurement" button
		And I change checkbox "Purchase"
		And I click "OK" button
		And I go to line in "ItemList" table
			| 'Item'  | 'Item key' | 'Q'     |
			| 'Boots' | '38/18SD'  | '8,000' |
		And I move one line down in "ItemList" table and select line
		And in the table "ItemList" I click "Procurement" button
		And I change checkbox "Repeal"
		And I click "OK" button
	* Check filling in Procurement method in the Sales order
		And "ItemList" table contains lines
		| 'Item'       | 'Item key'  | 'Procurement method' | 'Q'     |
		| 'Shirt'      | '38/Black'  | 'Stock'              | '5,000' |
		| 'Boots'      | '38/18SD'   | 'Repeal'             | '8,000' |
		| 'High shoes' | '37/19SD'   | 'Repeal'             | '2,000' |
		| 'Trousers'   | '38/Yellow' | 'Purchase'           | '3,000' |
	* Add a line with the service
		And in the table "ItemList" I click the button named "ItemListAdd"
		And I click choice button of "Item" attribute in "ItemList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Service'       |
		And I select current line in "List" table
		And I finish line editing in "ItemList" table
		And I click choice button of the attribute named "ItemListItemKey" in "ItemList" table
		And I go to line in "List" table
			| 'Item'     | 'Item key'  |
			| 'Service'  | 'Rent' |
		And I select current line in "List" table
		And I activate "Procurement method" field in "ItemList" table
		And I select "Stock" exact value from "Procurement method" drop-down list in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Check the cleaning method on the line with the service
		And I go to line in "ItemList" table
			| 'Item'    | 'Item key' | 'Procurement method' |
			| 'Service' | 'Rent'     | 'Stock'              |
		And I activate "Procurement method" field in "ItemList" table
		And I select current line in "ItemList" table
		And I click Clear button of "Procurement method" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
		And I go to line in "ItemList" table
			| 'Item'     | 'Item key'  | 'Procurement method' |
			| 'Trousers' | '38/Yellow' | 'Purchase'           |
		And "ItemList" table contains lines
			| 'Item'       | 'Item key'  | 'Procurement method' |
			| 'Shirt'      | '38/Black'  | 'Stock'              |
			| 'Boots'      | '38/18SD'   | 'Repeal'             |
			| 'High shoes' | '37/19SD'   | 'Repeal'             |
			| 'Trousers'   | '38/Yellow' | 'Purchase'           |
			| 'Service'    | 'Rent'      | ''                   |
		And I click the button named "FormPost"
	* Check the cleaning method on the line with the product
		And I go to line in "ItemList" table
			| 'Item'     | 'Item key'  | 'Procurement method' |
			| 'Trousers' | '38/Yellow' | 'Purchase'           |
		And I click Clear button of "Procurement method" attribute in "ItemList" table
		And I finish line editing in "ItemList" table
		And I go to line in "ItemList" table
			| 'Item'       | 'Item key' | 'Procurement method' |
			| 'High shoes' | '37/19SD'  | 'Repeal'             |
		And I click the button named "FormPost"
		Then I wait that in user messages the "Field [Procurement method] is empty." substring will appear in 30 seconds
		And I close all client application windows


Scenario: check filling in partner and customer/vendor sign when creating Partner term from partner card
	And I close all client application windows
	* Opening a customer partner card
		Given I open hyperlink "e1cib/list/Catalog.Partners"
		And I go to line in "List" table
			| 'Description' |
			| 'Kalipso' |
		And I select current line in "List" table
	* Open a creation form Partner term
		And In this window I click command interface button "Partner terms"
		And I click the button named "FormCreate"
	* Check filling in partner and customer sign
		Then the form attribute named "Partner" became equal to "Kalipso"
		Then the form attribute named "Type" became equal to "Customer"
	* Open a supplier partner card
		Given I open hyperlink "e1cib/list/Catalog.Partners"
		And I go to line in "List" table
			| 'Description' |
			| 'Veritas' |
		And I select current line in "List" table
	* Open a creation form Partner term
		And In this window I click command interface button "Partner terms"
		And I click the button named "FormCreate"
	* Check filling in Partner and Vendor sign
		Then the form attribute named "Partner" became equal to "Veritas"
		Then the form attribute named "Type" became equal to "Vendor"
	And I close all client application windows

Scenario: _999999 close TestClient session
	And I close TestClient session