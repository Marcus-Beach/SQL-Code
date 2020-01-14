USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateThingSP]    Script Date: 1/13/2020 8:18:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Thing SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateThingSP](@NAME AS NVARCHAR(50), @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @THINGID AS INT
	SET @THINGID = ((SELECT top 1 LocalID from Things order by LocalID desc) + 1)
	BEGIN TRANSACTION
    INSERT INTO Things(LocalID, Name)
	VALUES (@THINGID, @NAME)
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, UserID, ThingID, Date)
	VALUES (@TRANSID, @USERID, @THINGID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
