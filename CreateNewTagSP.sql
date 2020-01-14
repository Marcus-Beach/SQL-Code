USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateTagSP]    Script Date: 1/13/2020 8:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateTagSP](@NAME AS NVARCHAR(50), @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TAGID AS INT
	SET @TAGID = ((SELECT top 1 LocalID from Tags order by LocalID desc) + 1)
	BEGIN TRANSACTION
    INSERT INTO Things(LocalID, Name)
	VALUES (@TAGID, @NAME)
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, UserID, TagID, Date)
	VALUES (@TRANSID, @USERID, @TAGID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
