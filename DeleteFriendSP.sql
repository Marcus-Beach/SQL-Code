USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetFriendsSP]    Script Date: 1/21/2020 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Delete Friend SP
-- =============================================
ALTER PROCEDURE [dbo].[DeleteFriendSP](@USERID AS INT, @FRIENDID AS INT, @TRANSID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Friends WHERE (FriendID = @FRIENDID AND UserID = @USERID) OR (FriendID = @USERID AND UserID = @FRIENDID)
	IF @TRANSID IS NULL
	BEGIN
		INSERT INTO Transactions(UserID, FriendID, Date)
		VALUES (@USERID, @FRIENDID, GETDATE())
		SET @TRANSID = @@IDENTITY
	END
	ELSE
	BEGIN
		UPDATE Transactions SET UserID = @USERID, FriendID = @FRIENDID WHERE TransactionID = @TRANSID
	END
	SELECT @TRANSID
END
