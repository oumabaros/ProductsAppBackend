USE [master]
GO
/****** Object:  Database [ProdApp]    Script Date: 17/05/2021 01:52:45 ******/
CREATE DATABASE [ProdApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProdApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProdApp.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProdApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProdApp_log.ldf' , SIZE = 2624KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProdApp] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProdApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProdApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProdApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProdApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProdApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProdApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProdApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProdApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProdApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProdApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProdApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProdApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProdApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProdApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProdApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProdApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProdApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProdApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProdApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProdApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProdApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProdApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ProdApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProdApp] SET RECOVERY FULL 
GO
ALTER DATABASE [ProdApp] SET  MULTI_USER 
GO
ALTER DATABASE [ProdApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProdApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProdApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProdApp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProdApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProdApp', N'ON'
GO
USE [ProdApp]
GO
/****** Object:  UserDefinedFunction [dbo].[GetAttributeName]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAttributeName]
(
   @Id int
)
RETURNS Varchar(250)
AS 
BEGIN
	DECLARE @Attrib Varchar(250)
	SET @Attrib=(SELECT AttributeValue FROM ProductAttributeValues WHERE Id=@Id)
	Return @Attrib
END

GO
/****** Object:  UserDefinedFunction [dbo].[GetAttributeTypeName]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetAttributeTypeName]
(
   @Id int
)
RETURNS Varchar(250)
AS 
BEGIN
	DECLARE @Attrib Varchar(250)
	SET @Attrib=(SELECT AttributeName FROM ProductAttributes WHERE Id=@Id)
	Return @Attrib
END

GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ProductId] [int] NOT NULL,
	[ProductAttributeValueId] [int] NOT NULL,
	[Selected] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductAttributeValues]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributeValues](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductAttributeId] [int] NOT NULL,
	[AttributeValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductAttributeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductProductAttributeValues]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProductAttributeValues](
	[ProductId] [int] NOT NULL,
	[ProductAttributeValueId] [int] NOT NULL,
	[Selected] [bit] NOT NULL CONSTRAINT [DF__ProductPr__Selec__47DBAE45]  DEFAULT (CONVERT([bit],(0))),
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ProductProductAttributeValues] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[SkuId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Skus]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkuName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Skus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[SplitInts]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SplitInts]
(
   @List      VARCHAR(MAX),
   @Delimiter VARCHAR(255)
)
RETURNS TABLE
AS
  RETURN ( SELECT Item = CONVERT(INT, Item) FROM
      ( SELECT Item = x.i.value('(./text())[1]', 'varchar(max)')
        FROM ( SELECT [XML] = CONVERT(XML, '<i>'
        + REPLACE(@List, @Delimiter, '</i><i>') + '</i>').query('.')
          ) AS a CROSS APPLY [XML].nodes('i') AS x(i) ) AS y
      WHERE Item IS NOT NULL
  );


GO
/****** Object:  Index [IX_ProductAttributeValues_ProductAttributeId]    Script Date: 17/05/2021 01:52:45 ******/
CREATE NONCLUSTERED INDEX [IX_ProductAttributeValues_ProductAttributeId] ON [dbo].[ProductAttributeValues]
(
	[ProductAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductProductAttributeValues_ProductAttributeValueId]    Script Date: 17/05/2021 01:52:45 ******/
CREATE NONCLUSTERED INDEX [IX_ProductProductAttributeValues_ProductAttributeValueId] ON [dbo].[ProductProductAttributeValues]
(
	[ProductAttributeValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 17/05/2021 01:52:45 ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_SkuId]    Script Date: 17/05/2021 01:52:45 ******/
CREATE NONCLUSTERED INDEX [IX_Products_SkuId] ON [dbo].[Products]
(
	[SkuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductAttributeValues]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributeValues_ProductAttributes_ProductAttributeId] FOREIGN KEY([ProductAttributeId])
REFERENCES [dbo].[ProductAttributes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttributeValues] CHECK CONSTRAINT [FK_ProductAttributeValues_ProductAttributes_ProductAttributeId]
GO
ALTER TABLE [dbo].[ProductProductAttributeValues]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductProductAttributeValues_ProductAttributeValues_ProductAttributeValueId] FOREIGN KEY([ProductAttributeValueId])
REFERENCES [dbo].[ProductAttributeValues] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductProductAttributeValues] NOCHECK CONSTRAINT [FK_ProductProductAttributeValues_ProductAttributeValues_ProductAttributeValueId]
GO
ALTER TABLE [dbo].[ProductProductAttributeValues]  WITH NOCHECK ADD  CONSTRAINT [FK_ProductProductAttributeValues_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductProductAttributeValues] NOCHECK CONSTRAINT [FK_ProductProductAttributeValues_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Skus_SkuId] FOREIGN KEY([SkuId])
REFERENCES [dbo].[Skus] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Skus_SkuId]
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProducts]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Products.Id as 'ProductId',
	Products.ProductName,
	Products.SkuId,
	Products.Price,
	Products.CategoryId,
	Categories.CategoryName,
	Skus.SkuName,
	dbo.GetAttributeName(ProductProductAttributeValues.ProductAttributeValueId) AS 'Attributes',
	ProductProductAttributeValues.Selected
	FROM Products
	INNER JOIN Categories
	ON Products.CategoryId=Categories.Id
	INNER JOIN Skus
	ON Products.SkuId=Skus.Id
	INNER JOIN ProductProductAttributeValues
	ON Products.Id=ProductProductAttributeValues.ProductId
		
END

GO
/****** Object:  StoredProcedure [dbo].[GetSelectedAtrributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSelectedAtrributes] 
	-- Add the parameters for the stored procedure here
	@ProductId INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ProductId,ProductAttributeValueId,dbo.GetAttributeName(ProductAttributeValueId) as 'AttributeName',Selected FROM ProductProductAttributeValues WHERE ProductId=@ProductId
END

GO
/****** Object:  StoredProcedure [dbo].[p_AddProductAttributesValues
]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_AddProductAttributesValues
]
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@List VARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			DECLARE @MyList TABLE (Value NVARCHAR(50))
			INSERT INTO @MyList SELECT Id = Item FROM dbo.SplitInts(@List, ',');
			DECLARE @value VARCHAR(23)
			DECLARE db_cursor CURSOR FOR  
			SELECT Value FROM @MyList
			OPEN db_cursor   
			FETCH NEXT FROM db_cursor INTO @value   
			WHILE @@FETCH_STATUS = 0   
			BEGIN   
				INSERT INTO ProductProductAttributeValues(ProductId,ProductAttributeValueId)
				VALUES(@ProductId,CAST(@value AS INT))
					
				FETCH NEXT FROM db_cursor INTO @value   
			END   
			CLOSE db_cursor   
			DEALLOCATE db_cursor
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_AddProductAttributesValues__]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_AddProductAttributesValues__]
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@List VARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			DECLARE @MyList TABLE (Value NVARCHAR(50))
			INSERT INTO @MyList SELECT Id = Item FROM dbo.SplitInts(@List, ',');
			DECLARE @value VARCHAR(23)
			DECLARE db_cursor CURSOR FOR  
			SELECT Value FROM @MyList
			OPEN db_cursor   
			FETCH NEXT FROM db_cursor INTO @value   
			WHILE @@FETCH_STATUS = 0   
			BEGIN   
				INSERT INTO ProductProductAttributeValues(ProductId,ProductAttributeValueId)
				VALUES(@ProductId,CAST(@value AS INT))
					
				FETCH NEXT FROM db_cursor INTO @value   
			END   
			CLOSE db_cursor   
			DEALLOCATE db_cursor
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CountCategory]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CountCategory]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION COUNTCATEGORY
			select count(Id) as 'count' from Categories(NOLOCK)
			
		COMMIT TRANSACTION COUNTCATEGORY
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION COUNTCATEGORY
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CountProduct]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CountProduct]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION COUNTPRODUCT
			select count(Id) as 'count' from Products(NOLOCK)
			
		COMMIT TRANSACTION COUNTPRODUCT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION COUNTPRODUCT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CountSku]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CountSku]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION COUNTSKU
			select count(Id) as 'count' from Skus(NOLOCK)
			
		COMMIT TRANSACTION COUNTSKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION COUNTSKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateAttributes]
	-- Add the parameters for the stored procedure here
	@AttributeName varchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
			insert into ProductAttributes(AttributeName) values(@AttributeName)			
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateAttributesValues]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateAttributesValues]
	-- Add the parameters for the stored procedure here
	@ProductAttributeId int,
	@AttributeValue varchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATEATTRIBUTE
			insert into ProductAttributeValues(ProductAttributeId,AttributeValue) 
			values(@ProductAttributeId,@AttributeValue)	
			
		COMMIT TRANSACTION CREATEATTRIBUTE
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATEATTRIBUTE
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateCategory]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateCategory]
	-- Add the parameters for the stored procedure here
	@CategoryName varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATECATEGORY
			insert into Categories(CategoryName) values(@CategoryName)
			
		COMMIT TRANSACTION CREATECATEGORY
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATECATEGORY
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateProduct]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateProduct]
	-- Add the parameters for the stored procedure here
	@ProductName varchar(50),
	@SkuId int,
	@Price decimal(5,2),
	@CategoryId int,
	@Attributes varchar(55)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATEPRODUCT
			DECLARE @DataID int
			DECLARE @Delimeter char(1)
			SET @Delimeter = ','

			insert into Products(ProductName,SkuId,Price,CategoryId) 
			values(@ProductName,@SkuId,@Price,@CategoryId)	
			SET @DataID = (SELECT CAST(scope_identity() AS int));

			
			DECLARE @tblAttributes TABLE(Id int,Attributes int,Selected bit)
			DECLARE @tblMissingAttributes TABLE(Id int)
			DECLARE @Attr varchar(50)
			DECLARE @StartPos int, @Length int
			WHILE LEN(@Attributes) > 0
			  BEGIN
				SET @StartPos = CHARINDEX(@Delimeter, @Attributes)
				IF @StartPos < 0 SET @StartPos = 0
				SET @Length = LEN(@Attributes) - @StartPos - 1
				IF @Length < 0 SET @Length = 0
				IF @StartPos > 0
				  BEGIN
					SET @Attr = SUBSTRING(@Attributes, 1, @StartPos - 1)
					SET @Attributes = SUBSTRING(@Attributes, @StartPos + 1, LEN(@Attributes) - @StartPos)
				  END
				ELSE
				  BEGIN
					SET @Attr = @Attributes
					SET @Attributes = ''
				  END
				INSERT @tblAttributes (Id,Attributes,Selected) VALUES(@DataID,CAST(@Attr AS INT),1)
			END
			INSERT INTO @tblMissingAttributes (Id) SELECT Id FROM ProductAttributeValues WHERE Id NOT IN(SELECT Attributes FROM @tblAttributes)
			
			DECLARE @IDList TABLE (ID INT)
			INSERT INTO @IDList SELECT Id FROM @tblMissingAttributes
			DECLARE @Ids INT
			WHILE EXISTS (SELECT * FROM @IDList)
				BEGIN
					SELECT @Ids=MIN(ID) FROM @IDList
					INSERT INTO  @tblAttributes (Id,Attributes,Selected) VALUES(@DataID,@Ids,0)
					DELETE FROM @IDList WHERE ID=@Ids
				END
			
			INSERT INTO ProductProductAttributeValues(ProductId,ProductAttributeValueId,Selected) SELECT Id,@Attributes,Selected FROM @tblAttributes
		COMMIT TRANSACTION CREATEPRODUCT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATEPRODUCT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateProducts]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateProducts]
	-- Add the parameters for the stored procedure here
	@ProductName varchar(50),
	@SkuId int,
	@Price decimal(5,2),
	@CategoryId int

	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATEPRODUCT
			insert into Products(ProductName,SkuId,Price,CategoryId) 
			values(@ProductName,@SkuId,@Price,@CategoryId)	
			
		COMMIT TRANSACTION CREATEPRODUCT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATEPRODUCT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_CreateSku]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_CreateSku]
	-- Add the parameters for the stored procedure here
	@SkuName varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATESKU
			insert into Skus(SkuName) values(@SkuName)
			
		COMMIT TRANSACTION CREATESKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATESKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_DeleteAttributesById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteAttributesById]
	-- Add the parameters for the stored procedure here
	@Id int
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
			delete from ProductAttributes  where Id=@Id			
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_DeleteAttributesValuesById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteAttributesValuesById]
	-- Add the parameters for the stored procedure here
	@Id int
		
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATEATTRIBUTE
			delete from ProductAttributeValues where Id=@Id
			
		COMMIT TRANSACTION CREATEATTRIBUTE
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATEATTRIBUTE
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_DeleteCategoryById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteCategoryById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION DELCAT
			delete from Categories where Id=@Id
			
		COMMIT TRANSACTION DELCAT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION DELCAT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_DeleteProductById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteProductById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION DELPROD
			delete from Products where Id=@Id	
			
		COMMIT TRANSACTION DELPROD
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION DELPROD
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_DeleteSkuById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_DeleteSkuById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION DELSKU
			delete from Skus where Id=@Id	
			
		COMMIT TRANSACTION DELSKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION DELSKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetAttributes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductAttributes.Id,
			ProductAttributes.AttributeName
			FROM 
			ProductAttributes 
										
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetAttributesById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetAttributesById]
	@Id int
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductAttributes.Id,
			ProductAttributes.AttributeName
			FROM 
			ProductAttributes 
			WHERE Id=@Id							
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetCategory]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetCategory]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETCAT
			SELECT Id,CategoryName FROM Categories
			
		COMMIT TRANSACTION GETCAT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETCAT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetCategoryById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetCategoryById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETCATBYID
			SELECT Id,CategoryName FROM Categories where Id=@Id
			
		COMMIT TRANSACTION  GETCATBYID
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION  GETCATBYID
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProduct]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProduct]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETPROD
			IF OBJECT_ID(N'tempdb..#T') IS NOT NULL AND OBJECT_ID(N'tempdb..#J') IS NOT NULL
			BEGIN
				DROP TABLE #T
				DROP TABLE #J
			END
			CREATE TABLE #T(id INT, value TEXT)
			CREATE TABLE #J(id INT, value TEXT)
			INSERT INTO #T 
			SELECT T2.ProductId, 
			STUFF((SELECT ',' +  dbo.GetAttributeName(T1.ProductAttributeValueId) FROM ProductProductAttributeValues T1  where T1.ProductId =T2.ProductId FOR XML PATH('')), 1 ,1, '') AS ProductAttributes
			FROM ProductProductAttributeValues T2
			GROUP BY T2.ProductId

			INSERT INTO #J 
			SELECT T2.ProductId, 
			STUFF((SELECT ',' +  CAST(T1.ProductAttributeValueId AS VARCHAR(4)) FROM ProductProductAttributeValues T1  where T1.ProductId =T2.ProductId FOR XML PATH('')), 1 ,1, '') AS ProductAttributeIds
			FROM ProductProductAttributeValues T2
			GROUP BY T2.ProductId

			SELECT Products.Id as 'ProductId',
			Products.ProductName,
			Products.SkuId,
			Products.Price,
			Products.CategoryId,
			Categories.CategoryName,
			Skus.SkuName
			--#J.value as 'AttributeIds',
			--#T.value as 'Attributes'
			FROM Products
			INNER JOIN Categories
			ON Products.CategoryId=Categories.Id
			INNER JOIN Skus
			ON Products.SkuId=Skus.Id
			--INNER JOIN #T ON #T.Id=Products.Id
			--INNER JOIN #J ON #J.Id=Products.Id				
		COMMIT TRANSACTION GETPROD
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETPROD
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductAttributesValues]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductAttributesValues]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductAttributeValues.Id,
			ProductAttributeValues.ProductAttributeId as 'ProductAttributeId',
			dbo.GetAttributeTypeName(ProductAttributeValues.ProductAttributeId) as 'AttributeName',
			ProductAttributeValues.AttributeValue
			FROM 
			ProductAttributeValues 
			INNER JOIN ProductAttributes ON ProductAttributeValues.ProductAttributeId=ProductAttributes.Id
							
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductAttributesValuesByAttributeId]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductAttributesValuesByAttributeId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductAttributeValues.Id,
			ProductAttributeValues.ProductAttributeId as 'AttributeId',
			dbo.GetAttributeTypeName(ProductAttributeValues.ProductAttributeId) as 'AttributeName',
			ProductAttributeValues.AttributeValue
			FROM 
			ProductAttributeValues 
			INNER JOIN ProductAttributes ON ProductAttributeValues.ProductAttributeId=ProductAttributes.Id
			WHERE ProductAttributeValues.Id=@Id 				
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductAttributesValuesByAttributeTypeId]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductAttributesValuesByAttributeTypeId]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductAttributeValues.Id,
			ProductAttributeValues.ProductAttributeId as 'AttributeId',
			dbo.GetAttributeTypeName(ProductAttributeValues.ProductAttributeId) as 'AttributeName',
			ProductAttributeValues.AttributeValue
			FROM 
			ProductAttributeValues 
			INNER JOIN ProductAttributes ON ProductAttributeValues.ProductAttributeId=ProductAttributes.Id
			WHERE ProductAttributeValues.ProductAttributeId=@Id 				
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETPROD
			SELECT Products.Id as 'ProductId',
			Products.ProductName,
			Products.SkuId,
			Products.Price,
			Products.CategoryId,
			Categories.CategoryName,
			Skus.SkuName
			FROM Products
			INNER JOIN Categories
			ON Products.CategoryId=Categories.Id
			INNER JOIN Skus
			ON Products.SkuId=Skus.Id
			WHERE Products.Id=@Id
		COMMIT TRANSACTION GETPROD
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETPROD
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductProductAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductProductAttributes]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductProductAttributeValues.ProductId,
			ProductProductAttributeValues.ProductAttributeValueId,
			Products.ProductName,
			dbo.GetAttributeName(ProductProductAttributeValues.ProductAttributeValueId) as 'Attribute'
			FROM 
			ProductProductAttributeValues 
			INNER JOIN Products ON Products.Id=ProductProductAttributeValues.ProductId
							
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductProductAttributesByAttributeId]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductProductAttributesByAttributeId]
	-- Add the parameters for the stored procedure here
	@AttributeId int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductProductAttributeValues.ProductId,
			ProductProductAttributeValues.ProductAttributeValueId,
			Products.ProductName,
			dbo.GetAttributeName(ProductProductAttributeValues.ProductAttributeValueId) as 'Attribute'
			FROM 
			ProductProductAttributeValues 
			INNER JOIN Products ON Products.Id=ProductProductAttributeValues.ProductId
			WHERE ProductProductAttributeValues.ProductAttributeValueId=@AttributeId
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductProductAttributesByProductId]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductProductAttributesByProductId]
	-- Add the parameters for the stored procedure here
	@ProductId int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			SELECT 
			ProductProductAttributeValues.ProductId,
			ProductProductAttributeValues.ProductAttributeValueId,
			Products.ProductName,
			dbo.GetAttributeName(ProductProductAttributeValues.ProductAttributeValueId) as 'Attribute'
			FROM 
			ProductProductAttributeValues 
			INNER JOIN Products ON Products.Id=ProductProductAttributeValues.ProductId
			WHERE ProductProductAttributeValues.ProductId=@ProductId
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProducts]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProducts]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETPROD
			SELECT Products.Id as 'ProductId',
			Products.ProductName,
			Products.SkuId,
			Products.Price,
			Products.CategoryId,
			Categories.CategoryName,
			Skus.SkuName
			FROM Products
			INNER JOIN Categories
			ON Products.CategoryId=Categories.Id
			INNER JOIN Skus
			ON Products.SkuId=Skus.Id
						
		COMMIT TRANSACTION GETPROD
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETPROD
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetProductsByCategoryId]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetProductsByCategoryId]
	-- Add the parameters for the stored procedure here
	@CategoryId INT
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETPROD
			IF OBJECT_ID(N'tempdb..#T') IS NOT NULL
			BEGIN
				DROP TABLE #T
			END
			CREATE TABLE #T(id INT, value TEXT)

			INSERT INTO #T 
			SELECT T2.ProductId, 
			STUFF((SELECT ',' +  dbo.GetAttributeName(T1.ProductAttributeValueId) FROM ProductProductAttributeValues T1  where T1.ProductId =T2.ProductId FOR XML PATH('')), 1 ,1, '') AS ProductAttributes
			FROM ProductProductAttributeValues T2
			GROUP BY T2.ProductId


			SELECT Products.Id as 'ProductId',
			Products.ProductName,
			Products.SkuId,
			Products.Price,
			Products.CategoryId,
			Categories.CategoryName,
			Skus.SkuName,
			#T.value as 'Attributes'
			FROM Products
			INNER JOIN Categories
			ON Products.CategoryId=Categories.Id
			INNER JOIN Skus
			ON Products.SkuId=Skus.Id
			INNER JOIN #T ON #T.Id=Products.Id
			WHERE Products.CategoryId=@CategoryId
		COMMIT TRANSACTION GETPROD
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETPROD
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetSku]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetSku]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETSKU
			SELECT Id,SkuName FROM Skus
			
		COMMIT TRANSACTION GETSKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETSKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_GetSkuById]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_GetSkuById]
	-- Add the parameters for the stored procedure here
	@Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION GETSKU
			SELECT Id,SkuName FROM Skus where Id=@Id
			
		COMMIT TRANSACTION GETSKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION GETSKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateAttributes]
	-- Add the parameters for the stored procedure here
	@Id int,
	@AttributeName varchar(150)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
			update ProductAttributes set AttributeName=@AttributeName where Id=@Id			
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateAttributesValues]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateAttributesValues]
	-- Add the parameters for the stored procedure here
	@Id int,
	@ProductAttributeId int,
	@AttributeValue varchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION CREATEATTRIBUTE
			update ProductAttributeValues
			set ProductAttributeId=@ProductAttributeId,AttributeValue=@AttributeValue
			where Id=@Id
			
		COMMIT TRANSACTION CREATEATTRIBUTE
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION CREATEATTRIBUTE
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateCategory]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateCategory]
	-- Add the parameters for the stored procedure here
	@Id int,
	@CategoryName varchar(55)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION UPDATECAT
			update Categories set CategoryName=@CategoryName where Id=@Id
			
		COMMIT TRANSACTION UPDATECAT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION UPDATECAT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateProduct]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateProduct]
	-- Add the parameters for the stored procedure here
	@Id int,
	@ProductName varchar(50)=null,
	@SkuId int=null,
	@Price decimal(5,2)=null,
	@CategoryId int=null,
	@Attributes VARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION UPDATEPRODUCT
			UPDATE Products
			SET ProductName=IsNull(@ProductName, ProductName),
				SkuId=IsNull(@SkuId, SkuId),
				Price=IsNull(@Price, Price),
				CategoryId=IsNull(@CategoryId, CategoryId)
			WHERE Id=@Id
			
			DECLARE @DataID int;
			DECLARE @Delimeter char(1)
			SET @Delimeter = ','
			DECLARE @tblAttributes TABLE(Id int,Attributes int,Selected bit)
			DECLARE @tblMissingAttributes TABLE(Id int)
			DECLARE @Attr varchar(50)
			DECLARE @StartPos int, @Length int

			WHILE LEN(@Attributes) > 0
			  BEGIN
				SET @StartPos = CHARINDEX(@Delimeter, @Attributes)
				IF @StartPos < 0 SET @StartPos = 0
				SET @Length = LEN(@Attributes) - @StartPos - 1
				IF @Length < 0 SET @Length = 0
				IF @StartPos > 0
				  BEGIN
					SET @Attr = SUBSTRING(@Attributes, 1, @StartPos - 1)
					SET @Attributes = SUBSTRING(@Attributes, @StartPos + 1, LEN(@Attributes) - @StartPos)
				  END
				ELSE
				  BEGIN
					SET @Attr = @Attributes
					SET @Attributes = ''
				  END
				INSERT @tblAttributes (Id,Attributes,Selected) VALUES(@Id,CAST(@Attr AS INT),1)
			END
			
			INSERT INTO @tblMissingAttributes (Id) SELECT Id FROM ProductAttributeValues WHERE Id NOT IN(SELECT Attributes FROM @tblAttributes)
			
			DECLARE @IDList TABLE (ID INT)
			INSERT INTO @IDList SELECT Id FROM @tblMissingAttributes
			DECLARE @Ids INT

			WHILE EXISTS (SELECT * FROM @IDList)
				BEGIN
					SELECT @Ids=MIN(ID) FROM @IDList
					INSERT INTO  @tblAttributes (Id,Attributes,Selected) VALUES(@Id,@Ids,0)
					DELETE FROM @IDList WHERE ID=@Ids
				END
				select * from @tblAttributes
				INSERT INTO ProductProductAttributeValues(ProductId,ProductAttributeValueId,Selected) SELECT Id,Attributes,Selected FROM @tblAttributes
			
		COMMIT TRANSACTION UPDATEPRODUCT
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION UPDATEPRODUCT
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateProductAttributes]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateProductAttributes]
	-- Add the parameters for the stored procedure here
	@ProductId int,
	@List VARCHAR(MAX)
	
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION PRODUCTATTRIBUTES
				
			DECLARE @MyList TABLE (Value NVARCHAR(50))
			INSERT INTO @MyList SELECT Id = Item FROM dbo.SplitInts(@List, ',');
			DECLARE @value VARCHAR(23)
			DECLARE db_cursor CURSOR FOR  
			SELECT Value FROM @MyList
			OPEN db_cursor   
			FETCH NEXT FROM db_cursor INTO @value   
			WHILE @@FETCH_STATUS = 0   
			BEGIN   
				UPDATE ProductProductAttributeValues SET ProductAttributeValueId=CAST(@value AS INT)
				WHERE ProductId=@ProductId
					
				FETCH NEXT FROM db_cursor INTO @value   
			END   
			CLOSE db_cursor   
			DEALLOCATE db_cursor
		COMMIT TRANSACTION PRODUCTATTRIBUTES
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION PRODUCTATTRIBUTES
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[p_UpdateSku]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_UpdateSku]
	-- Add the parameters for the stored procedure here
	@Id int,
	@SkuName varchar(55)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	BEGIN TRY
		BEGIN TRANSACTION UPDATESKU
			update Skus set SkuName=@SkuName where Id=@Id
			
		COMMIT TRANSACTION UPDATESKU
	END TRY
	BEGIN CATCH 
	  IF (@@TRANCOUNT > 0)
	   BEGIN
		  ROLLBACK TRANSACTION UPDATESKU
	   END 

		DECLARE @ERROR_MESSAGE	Varchar(100)

		SELECT @ERROR_MESSAGE = ERROR_MESSAGE()

		RAISERROR (@ERROR_MESSAGE,16,1)

	END CATCH	

SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[Test]    Script Date: 17/05/2021 01:52:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Test] 
	-- Add the parameters for the stored procedure here
	@Attributes varchar(50),
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @DataID int
			DECLARE @Delimeter char(1)
			SET @Delimeter = ','

						
			DECLARE @tblAttributes TABLE(Id int,Attributes int,Selected bit)
			DECLARE @tblMissingAttributes TABLE(Id int)
			DECLARE @Attr varchar(50)
			DECLARE @StartPos int, @Length int
			WHILE LEN(@Attributes) > 0
			  BEGIN
				SET @StartPos = CHARINDEX(@Delimeter, @Attributes)
				IF @StartPos < 0 SET @StartPos = 0
				SET @Length = LEN(@Attributes) - @StartPos - 1
				IF @Length < 0 SET @Length = 0
				IF @StartPos > 0
				  BEGIN
					SET @Attr = SUBSTRING(@Attributes, 1, @StartPos - 1)
					SET @Attributes = SUBSTRING(@Attributes, @StartPos + 1, LEN(@Attributes) - @StartPos)
				  END
				ELSE
				  BEGIN
					SET @Attr = @Attributes
					SET @Attributes = ''
				  END
				INSERT @tblAttributes (Id,Attributes,Selected) VALUES(@Id,CAST(@Attr AS INT),1)
			END
			INSERT INTO @tblMissingAttributes (Id) SELECT Id FROM ProductAttributeValues WHERE Id NOT IN(SELECT Attributes FROM @tblAttributes)
			
			DECLARE @IDList TABLE (ID INT)
			INSERT INTO @IDList SELECT Id FROM @tblMissingAttributes
			DECLARE @Ids INT
			WHILE EXISTS (SELECT * FROM @IDList)
				BEGIN
					SELECT @Ids=MIN(ID) FROM @IDList
					INSERT INTO  @tblAttributes (Id,Attributes,Selected) VALUES(@Id,@Ids,0)
					DELETE FROM @IDList WHERE ID=@Ids
				END
			END

		
			
	SELECT * FROM @tblAttributes 
	INSERT INTO ProductProductAttributeValues(ProductId,ProductAttributeValueId,Selected) SELECT Id,@Attributes,Selected FROM @tblAttributes

GO
USE [master]
GO
ALTER DATABASE [ProdApp] SET  READ_WRITE 
GO
