-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Setting SP
-- =============================================
CREATE PROCEDURE CreateSettingSP(@USERID AS INT, @FRIENDID AS INT, @THINGID AS INT)
	
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
	INSERT INTO Transactions(TransactionID, UserID, SettingID, FriendID, Date)
	VALUES (((SELECT top 1 TransactionID from Transactions order by TransactionID desc) + 1), @USERID, @SETTINGID, @FRIENDID, GETDATE())
	COMMIT
END
GO
