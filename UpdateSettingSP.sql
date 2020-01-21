USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSettingSP]    Script Date: 1/20/2020 6:44:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/14/2020
-- Description:	Update Setting SP
-- =============================================
ALTER PROCEDURE [dbo].[UpdateSettingSP](@SETTINGID AS INT, @CANMOVE AS BIT, @CANPLACE AS BIT, @CANREMOVE AS BIT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Settings
	SET CanMove = @CANMOVE, CanPlace = @CANMOVE, CanRemove = @CANREMOVE WHERE LocalID = @SETTINGID
	INSERT INTO Transactions(SettingID, Date)
	VALUES (@SETTINGID, GETDATE())
	SELECT @@IDENTITY
END
