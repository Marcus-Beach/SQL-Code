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
-- Description:	Delete Setting SP
-- =============================================
CREATE PROCEDURE [dbo].[DeleteSettingSP](@SETTINGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DELETE FROM Settings WHERE LocalID = @SETTINGID
END