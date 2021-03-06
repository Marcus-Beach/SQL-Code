USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateSettingSP]    Script Date: 1/20/2020 6:18:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Setting SP
-- =============================================
ALTER PROCEDURE [dbo].[CreateSettingSP](@USERID AS INT, @FRIENDID AS INT, @TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Settings(CanMove, CanPlace, CanRemove)
	VALUES (1, 1, 1)
	INSERT INTO Transactions(UserID, SettingID, FriendID, TagID, Date)
	VALUES (@USERID, @@IDENTITY, @FRIENDID, @TAGID, GETDATE())
	SELECT @@IDENTITY
END
