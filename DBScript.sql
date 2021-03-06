USE [Kona]
GO
/****** Object:  Table [dbo].[DeliveryMethod]    Script Date: 10/02/2009 09:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethod](
	[DeliveryMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DeliveryMethod] PRIMARY KEY CLUSTERED 
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxRates]    Script Date: 10/02/2009 09:49:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaxRates](
	[TaxRateID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [money] NOT NULL CONSTRAINT [DF_TaxRates_Rate]  DEFAULT ((0)),
	[Region] [char](2) NOT NULL,
	[Country] [char](2) NOT NULL CONSTRAINT [DF_TaxRates_Country]  DEFAULT ('US'),
	[PostalCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaxRates] PRIMARY KEY CLUSTERED 
(
	[TaxRateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/02/2009 09:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](1500) NULL,
	[ParentID] [int] NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_Categories_IsDefault]  DEFAULT ((0)),
	[DefaultImageFile] [nvarchar](255) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 10/02/2009 09:48:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerBehaviors]    Script Date: 10/02/2009 09:48:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerBehaviors](
	[UserBehaviorID] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UseBehaviors] PRIMARY KEY CLUSTERED 
(
	[UserBehaviorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 10/02/2009 09:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[First] [nvarchar](50) NOT NULL,
	[Last] [nvarchar](50) NOT NULL CONSTRAINT [DF_Customers_Last]  DEFAULT (N'en'),
	[LanguageCode] [char](2) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 10/02/2009 09:48:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Street1] [nvarchar](50) NOT NULL,
	[Street2] [nvarchar](50) NULL,
	[City] [nvarchar](150) NOT NULL,
	[StateOrProvince] [nvarchar](50) NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_Addresses_IsDefault]  DEFAULT ((1)),
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingMethods]    Script Date: 10/02/2009 09:49:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingMethods](
	[ShippingMethodID] [int] NOT NULL,
	[Carrier] [nvarchar](50) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[RatePerPound] [decimal](18, 0) NOT NULL CONSTRAINT [DF_ShippingMethods_RatePerPound]  DEFAULT ((0)),
	[BaseRate] [decimal](18, 0) NOT NULL CONSTRAINT [DF_ShippingMethods_BaseRate]  DEFAULT ((0)),
	[EstimatedDelivery] [nvarchar](50) NULL,
	[DaysToDeliver] [int] NOT NULL CONSTRAINT [DF_ShippingMethods_DaysToDeliver]  DEFAULT ((2)),
 CONSTRAINT [PK_ShippingMethods] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryStatus]    Script Date: 10/02/2009 09:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryStatus](
	[InventoryStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_InventoryStatus] PRIMARY KEY CLUSTERED 
(
	[InventoryStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/02/2009 09:49:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[SKU] [nvarchar](50) NOT NULL,
	[SiteID] [uniqueidentifier] NOT NULL,
	[DeliveryMethodID] [int] NOT NULL CONSTRAINT [DF_Products_DeliveryMethodID]  DEFAULT ((1)),
	[ProductName] [nvarchar](50) NOT NULL,
	[BasePrice] [decimal](18, 0) NOT NULL CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)),
	[WeightInPounds] [money] NOT NULL CONSTRAINT [DF_Products_WeightInPounds]  DEFAULT ((0)),
	[DateAvailable] [datetime] NOT NULL CONSTRAINT [DF_Products_DateAvailable]  DEFAULT ('1/1/2003'),
	[InventoryStatusID] [int] NOT NULL CONSTRAINT [DF_Products_InventoryStatusID]  DEFAULT ((1)),
	[EstimatedDelivery] [nvarchar](50) NOT NULL CONSTRAINT [DF_Products_EstimatedDelivery]  DEFAULT (N'3-5 Days'),
	[AllowBackOrder] [bit] NOT NULL CONSTRAINT [DF_Products_AllowBackOrder]  DEFAULT ((1)),
	[IsTaxable] [bit] NOT NULL CONSTRAINT [DF_Products_IsTaxable]  DEFAULT ((1)),
	[DefaultImageFile] [nvarchar](255) NULL,
	[Version] [timestamp] NOT NULL,
	[AmountOnHand] [int] NOT NULL CONSTRAINT [DF_Products_AmountOnHand]  DEFAULT ((10)),
	[AllowPreOrder] [bit] NOT NULL CONSTRAINT [DF_Products_AllowPreOrder]  DEFAULT ((1)),
	[Options] [image] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories_Products]    Script Date: 10/02/2009 09:48:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories_Products](
	[CategoryID] [int] NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories_Products] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[SKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/02/2009 09:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [uniqueidentifier] NOT NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserLanguageCode] [char](2) NOT NULL CONSTRAINT [DF_Orders_UserLanguageCode]  DEFAULT ('en'),
	[TaxAmount] [money] NOT NULL CONSTRAINT [DF_Orders_TaxAmount]  DEFAULT ((0)),
	[ShippingService] [nvarchar](50) NULL,
	[ShippingAmount] [money] NOT NULL CONSTRAINT [DF_Orders_ShippingAmount]  DEFAULT ((0)),
	[DiscountAmount] [money] NOT NULL CONSTRAINT [DF_Orders_DiscountAmount]  DEFAULT ((0)),
	[DiscountReason] [nvarchar](50) NULL,
	[ShippingAddressID] [int] NULL,
	[BillingAddressID] [int] NULL,
	[DateShipped] [datetime] NULL,
	[TrackingNumber] [nvarchar](50) NULL,
	[EstimatedDelivery] [datetime] NULL,
	[SubTotal] [money] NOT NULL CONSTRAINT [DF_Orders_SubTotal]  DEFAULT ((0)),
	[OrderStatusID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Orders_CreatedOn]  DEFAULT (getdate()),
	[ExecutedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NOT NULL CONSTRAINT [DF_Orders_ModifiedOn]  DEFAULT (getdate()),
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerEvents]    Script Date: 10/02/2009 09:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerEvents](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[UserBehaviorID] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[EventDate] [datetime] NOT NULL CONSTRAINT [DF_UserEvents_EventDate]  DEFAULT (getdate()),
	[IP] [nvarchar](50) NOT NULL,
	[SKU] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[OrderID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_UserEvents] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 10/02/2009 09:48:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[SKU] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_CartItems_DateAdded]  DEFAULT (getdate()),
	[DiscountAmount] [decimal](18, 0) NOT NULL CONSTRAINT [DF_CartItems_DiscountAmount]  DEFAULT ((0)),
	[DiscountReason] [nvarchar](255) NULL,
 CONSTRAINT [PK_CartItems_1] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC,
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 10/02/2009 09:48:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[OrderID] [uniqueidentifier] NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL CONSTRAINT [DF_ShoppingCartItem_Quantity]  DEFAULT ((1)),
	[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_ShoppingCartItem_CreatedOn]  DEFAULT (getdate()),
	[LineItemPrice] [decimal](18, 0) NOT NULL CONSTRAINT [DF_OrderItems_LineItemPrice]  DEFAULT ((0)),
	[Discount] [decimal](18, 0) NOT NULL CONSTRAINT [DF_OrderItems_Discount]  DEFAULT ((0)),
	[DiscountReason] [nvarchar](255) NULL,
	[Version] [timestamp] NOT NULL,
	[LineItemWeightInPounds] [decimal](18, 0) NOT NULL CONSTRAINT [DF_OrderItems_LineItemWeightInPounds]  DEFAULT ((5)),
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[SKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_CrossSell]    Script Date: 10/02/2009 09:49:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_CrossSell](
	[SKU] [nvarchar](50) NOT NULL,
	[CrossSKU] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products_CrossSell] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC,
	[CrossSKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Related]    Script Date: 10/02/2009 09:49:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Related](
	[SKU] [nvarchar](50) NOT NULL,
	[RelatedSKU] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Products_Related] PRIMARY KEY CLUSTERED 
(
	[SKU] ASC,
	[RelatedSKU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 10/02/2009 09:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[ProductImageID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[ThumbUrl] [nvarchar](150) NOT NULL,
	[FullImageUrl] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDescriptors]    Script Date: 10/02/2009 09:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductDescriptors](
	[DescriptorID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[LanguageCode] [char](2) NOT NULL CONSTRAINT [DF_ProductDescriptors_LanguageCode]  DEFAULT ('en'),
	[Title] [nvarchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_ProductDescriptors_IsDefault]  DEFAULT ((0)),
	[Body] [nvarchar](2500) NOT NULL,
 CONSTRAINT [PK_ProductDescriptors] PRIMARY KEY CLUSTERED 
(
	[DescriptorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventoryRecords]    Script Date: 10/02/2009 09:48:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryRecords](
	[InventoryRecordID] [int] IDENTITY(1,1) NOT NULL,
	[SKU] [nvarchar](50) NOT NULL,
	[Increment] [int] NOT NULL CONSTRAINT [DF_InventoryRecords_Increment]  DEFAULT ((0)),
	[DateEntered] [datetime] NOT NULL CONSTRAINT [DF_InventoryRecords_DateEntered]  DEFAULT (getdate()),
	[Notes] [nvarchar](500) NULL,
 CONSTRAINT [PK_InventoryRecords] PRIMARY KEY CLUSTERED 
(
	[InventoryRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 10/02/2009 09:49:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [uniqueidentifier] NOT NULL,
	[OrderID] [uniqueidentifier] NOT NULL,
	[TransactionDate] [datetime] NOT NULL CONSTRAINT [DF_Transactions_TransactionDate]  DEFAULT (getdate()),
	[Amount] [money] NOT NULL CONSTRAINT [DF_Transactions_Amount]  DEFAULT ((0)),
	[AuthorizationCode] [nvarchar](50) NULL,
	[Notes] [nvarchar](50) NULL,
	[Processor] [nvarchar](50) NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_CartItems_Customers]    Script Date: 10/02/2009 09:48:38 ******/
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Customers] FOREIGN KEY([UserName])
REFERENCES [dbo].[Customers] ([UserName])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Customers]
GO
/****** Object:  ForeignKey [FK_CartItems_Products]    Script Date: 10/02/2009 09:48:38 ******/
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
/****** Object:  ForeignKey [FK_Categories_Products_Categories]    Script Date: 10/02/2009 09:48:40 ******/
ALTER TABLE [dbo].[Categories_Products]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Categories_Products] CHECK CONSTRAINT [FK_Categories_Products_Categories]
GO
/****** Object:  ForeignKey [FK_Categories_Products_Products]    Script Date: 10/02/2009 09:48:41 ******/
ALTER TABLE [dbo].[Categories_Products]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Products_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[Categories_Products] CHECK CONSTRAINT [FK_Categories_Products_Products]
GO
/****** Object:  ForeignKey [FK_CustomerEvents_Customers]    Script Date: 10/02/2009 09:48:43 ******/
ALTER TABLE [dbo].[CustomerEvents]  WITH CHECK ADD  CONSTRAINT [FK_CustomerEvents_Customers] FOREIGN KEY([UserName])
REFERENCES [dbo].[Customers] ([UserName])
GO
ALTER TABLE [dbo].[CustomerEvents] CHECK CONSTRAINT [FK_CustomerEvents_Customers]
GO
/****** Object:  ForeignKey [FK_UserEvents_UseBehaviors]    Script Date: 10/02/2009 09:48:43 ******/
ALTER TABLE [dbo].[CustomerEvents]  WITH CHECK ADD  CONSTRAINT [FK_UserEvents_UseBehaviors] FOREIGN KEY([UserBehaviorID])
REFERENCES [dbo].[CustomerBehaviors] ([UserBehaviorID])
GO
ALTER TABLE [dbo].[CustomerEvents] CHECK CONSTRAINT [FK_UserEvents_UseBehaviors]
GO
/****** Object:  ForeignKey [FK_InventoryRecords_Products]    Script Date: 10/02/2009 09:48:47 ******/
ALTER TABLE [dbo].[InventoryRecords]  WITH CHECK ADD  CONSTRAINT [FK_InventoryRecords_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[InventoryRecords] CHECK CONSTRAINT [FK_InventoryRecords_Products]
GO
/****** Object:  ForeignKey [FK_OrderItems_Orders]    Script Date: 10/02/2009 09:48:50 ******/
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
/****** Object:  ForeignKey [FK_OrderItems_Products]    Script Date: 10/02/2009 09:48:50 ******/
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
/****** Object:  ForeignKey [FK_Orders_Addresses]    Script Date: 10/02/2009 09:48:55 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses] FOREIGN KEY([ShippingAddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses]
GO
/****** Object:  ForeignKey [FK_Orders_Addresses1]    Script Date: 10/02/2009 09:48:55 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Addresses1] FOREIGN KEY([BillingAddressID])
REFERENCES [dbo].[Addresses] ([AddressID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Addresses1]
GO
/****** Object:  ForeignKey [FK_Orders_Customers]    Script Date: 10/02/2009 09:48:56 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([UserName])
REFERENCES [dbo].[Customers] ([UserName])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
/****** Object:  ForeignKey [FK_Orders_OrderStatus]    Script Date: 10/02/2009 09:48:56 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_OrderStatus]
GO
/****** Object:  ForeignKey [FK_ProductDescriptors_Products]    Script Date: 10/02/2009 09:48:58 ******/
ALTER TABLE [dbo].[ProductDescriptors]  WITH CHECK ADD  CONSTRAINT [FK_ProductDescriptors_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[ProductDescriptors] CHECK CONSTRAINT [FK_ProductDescriptors_Products]
GO
/****** Object:  ForeignKey [FK_ProductImages_Products]    Script Date: 10/02/2009 09:48:59 ******/
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products]
GO
/****** Object:  ForeignKey [FK_Products_DeliveryMethod]    Script Date: 10/02/2009 09:49:04 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_DeliveryMethod] FOREIGN KEY([DeliveryMethodID])
REFERENCES [dbo].[DeliveryMethod] ([DeliveryMethodID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_DeliveryMethod]
GO
/****** Object:  ForeignKey [FK_Products_InventoryStatus]    Script Date: 10/02/2009 09:49:04 ******/
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_InventoryStatus] FOREIGN KEY([InventoryStatusID])
REFERENCES [dbo].[InventoryStatus] ([InventoryStatusID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_InventoryStatus]
GO
/****** Object:  ForeignKey [FK_Products_CrossSell_Products]    Script Date: 10/02/2009 09:49:04 ******/
ALTER TABLE [dbo].[Products_CrossSell]  WITH CHECK ADD  CONSTRAINT [FK_Products_CrossSell_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[Products_CrossSell] CHECK CONSTRAINT [FK_Products_CrossSell_Products]
GO
/****** Object:  ForeignKey [FK_Products_CrossSell_Products1]    Script Date: 10/02/2009 09:49:05 ******/
ALTER TABLE [dbo].[Products_CrossSell]  WITH CHECK ADD  CONSTRAINT [FK_Products_CrossSell_Products1] FOREIGN KEY([CrossSKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[Products_CrossSell] CHECK CONSTRAINT [FK_Products_CrossSell_Products1]
GO
/****** Object:  ForeignKey [FK_Products_Related_Products]    Script Date: 10/02/2009 09:49:05 ******/
ALTER TABLE [dbo].[Products_Related]  WITH CHECK ADD  CONSTRAINT [FK_Products_Related_Products] FOREIGN KEY([SKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[Products_Related] CHECK CONSTRAINT [FK_Products_Related_Products]
GO
/****** Object:  ForeignKey [FK_Products_Related_Products1]    Script Date: 10/02/2009 09:49:05 ******/
ALTER TABLE [dbo].[Products_Related]  WITH CHECK ADD  CONSTRAINT [FK_Products_Related_Products1] FOREIGN KEY([RelatedSKU])
REFERENCES [dbo].[Products] ([SKU])
GO
ALTER TABLE [dbo].[Products_Related] CHECK CONSTRAINT [FK_Products_Related_Products1]
GO
/****** Object:  ForeignKey [FK_Transactions_Orders]    Script Date: 10/02/2009 09:49:11 ******/
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Orders]
GO
