USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateSettingSP]    Script Date: 1/14/2020 7:40:34 PM ******/
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
	DECLARE @SETTINGID AS INT
	SET @SETTINGID = ((SELECT top 1 LocalID from Settings order by LocalID desc) + 1)
	BEGIN TRANSACTION
    INSERT INTO Settings(LocalID, CanMove, CanPlace, CanRemove)
	VALUES (@SETTINGID, 1, 1, 1)
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, UserID, SettingID, FriendID, TagID, Date)
	VALUES (@TRANSID, @USERID, @SETTINGID, @FRIENDID, @TAGID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
