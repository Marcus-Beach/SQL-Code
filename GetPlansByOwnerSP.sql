USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[GetLocalPlanSP]    Script Date: 1/21/2020 6:35:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/21/2020
-- Description:	Get Plans By Owner SP
-- =============================================
CREATE PROCEDURE [dbo].[GetPlansByOwnerSP](@OWNERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT * FROM Plans WHERE OwnerID = @OWNERID
END
