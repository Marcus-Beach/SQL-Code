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
-- Description:	Get Things By Plan SP
-- =============================================
CREATE PROCEDURE [dbo].[GetThingsByPlanSP](@PLANID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Things WHERE LocalID IN (SELECT ThingID FROM Transactions WHERE PlanID = @PLANID)
END
