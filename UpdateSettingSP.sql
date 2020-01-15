USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateSettingSP]    Script Date: 1/14/2020 7:40:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/14/2020
-- Description:	Update Setting SP
-- =============================================
CREATE PROCEDURE [dbo].[UpdateSettingSP](@SETTINGID AS INT, @CANMOVE AS BIT, @CANPLACE AS BIT, @CANREMOVE AS BIT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	UPDATE Settings
	SET CanMove = @CANMOVE, CanPlace = @CANMOVE, CanRemove = @CANREMOVE
	DECLARE @TRANSID AS INT
	SET @TRANSID = ((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1)
	INSERT INTO Transactions(TransactionID, SettingID, Date)
	VALUES (@TRANSID, @SETTINGID, GETDATE())
	COMMIT
	SELECT @TRANSID
END
