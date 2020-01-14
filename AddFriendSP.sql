USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[AddFriendSP]    Script Date: 1/13/2020 8:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/13/2020
-- Description:	Add Friend SP
-- =============================================
ALTER PROCEDURE [dbo].[AddFriendSP](@FRIENDID AS INT, @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
    INSERT INTO Friends(FriendID, UserID, Confirmed)
	VALUES (@FRIENDID, @USERID, 1)
	INSERT INTO Friends(FriendID, UserID, Confirmed)
	VALUES (@USERID, @FRIENDID, 0)
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, UserID, FriendID, Date)
	VALUES (@TRANSID, @USERID, @FRIENDID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
