USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetSettingSP]    Script Date: 1/21/2020 7:23:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Get Settings By Friend and Tag SP
-- =============================================
CREATE PROCEDURE [dbo].[GetSettingsByFriendAndTagSP](@FRIENDID AS INT, @TAGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Settings WHERE LocalID IN (SELECT SettingID FROM Transactions WHERE FriendID = @FRIENDID AND TagID = @TAGID)
END