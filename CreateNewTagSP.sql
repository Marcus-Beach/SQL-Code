USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateTagSP]    Script Date: 1/14/2020 7:05:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Tag SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateTagSP](@NAME AS NVARCHAR(50), @USERID AS INT, @THINGID AS INT = NULL, @FRIENDID AS INT = NULL)
	
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
	INSERT INTO Transactions(TransactionID, UserID, TagID, ThingID, FriendID, Date)
	VALUES (@TRANSID, @USERID, @TAGID, @THINGID, @FRIENDID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
