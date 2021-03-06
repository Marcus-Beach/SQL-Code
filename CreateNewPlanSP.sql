USE [PicturePlanner]
GO
/****** Object:  StoredProcedure [dbo].[CreatePlanSP]    Script Date: 1/20/2020 6:15:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcus Beach
-- Create date: 01/06/2020
-- Description:	Create New Plan SP
-- =============================================
ALTER PROCEDURE [dbo].[CreatePlanSP](@OWNERID AS INT)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    INSERT INTO Plans(OwnerID)
	VALUES (@OWNERID)
	INSERT INTO Transactions(UserID, PlanID, Date)
	VALUES (@OWNERID, @@IDENTITY, GETDATE())
	SELECT @@IDENTITY
END
