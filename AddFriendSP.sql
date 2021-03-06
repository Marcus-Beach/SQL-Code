USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[AddFriendSP]    Script Date: 1/20/2020 6:05:40 PM ******/
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
    INSERT INTO Friends(FriendID, UserID, Confirmed)
	VALUES (@FRIENDID, @USERID, 1)
	INSERT INTO Friends(FriendID, UserID, Confirmed)
	VALUES (@USERID, @FRIENDID, 0)
	INSERT INTO Transactions(UserID, FriendID, Date)
	VALUES (@USERID, @FRIENDID, GETDATE())
	SELECT @@IDENTITY
END
