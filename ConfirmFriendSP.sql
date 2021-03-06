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
-- Description:	Confirm Friend SP
-- =============================================
CREATE PROCEDURE [dbo].[ConfirmFriendSP](@USERID AS INT, @FRIENDID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Friends SET Confirmed = 1 WHERE FriendID = @FRIENDID and UserID = @USERID
	INSERT INTO Transactions(UserID, FriendID, Date)
	VALUES (@USERID, @FRIENDID, GETDATE())
	SELECT @@IDENTITY
END
