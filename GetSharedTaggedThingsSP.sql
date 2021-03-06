USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreateThingSP]    Script Date: 1/15/2020 6:47:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/15/2020
-- Description:	Get Shared Tagged Things SP
-- =============================================
ALTER PROCEDURE [dbo].[GetSharedTaggedThingsSP](@TAGID AS INT, @USERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Things th JOIN Transactions tr ON th.SharedID = tr.SharedThingID WHERE tr.SharedTagID = @TAGID AND tr.UserID = @USERID
END