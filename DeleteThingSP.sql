USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetLocalThingSP]    Script Date: 1/21/2020 8:11:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Delete Thing SP
-- =============================================
ALTER PROCEDURE [dbo].[DeleteThingSP](@THINGID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE Plans
	SET LocalFloorID = NULL WHERE LocalFloorID = @THINGID
	DELETE FROM Transactions WHERE ThingID = @THINGID
	DELETE FROM Things WHERE LocalID = @THINGID
END
