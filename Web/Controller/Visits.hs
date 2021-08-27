module Web.Controller.Visits where

import Web.Controller.Prelude
import Web.View.Visits.Index
import Web.View.Visits.New
import Web.View.Visits.Edit
import Web.View.Visits.Show

instance Controller VisitsController where
    action VisitsAction = do
        visits <- query @Visit |> fetch
        render IndexView { .. }

    action NewVisitAction { clientId }= do
        let visit = newRecord |> set #clientId clientId
        client <- fetch clientId
        render NewView { .. }

    action ShowVisitAction { visitId } = do
        visit <- fetch visitId
        render ShowView { .. }

    action EditVisitAction { visitId } = do
        visit <- fetch visitId
        render EditView { .. }

    action UpdateVisitAction { visitId } = do
        visit <- fetch visitId
        visit
            |> buildVisit
            |> validateField #body nonEmpty
            |> ifValid \case
                Left visit -> render EditView { .. }
                Right visit -> do
                    visit <- visit |> updateRecord
                    setSuccessMessage "Visit updated"
                    redirectTo EditVisitAction { .. }

    action CreateVisitAction = do
        let
          visit = newRecord @Visit
          clientId :: (Id Client) = param "clientId"

        client <- fetch clientId

        visit
            |> buildVisit
            |> validateField #body nonEmpty
            |> set #clientId clientId
            |> ifValid \case
                Left visit -> render NewView { .. }
                Right visit -> do
                    visit <- visit |> createRecord
                    setSuccessMessage "Visit created"
                    redirectTo VisitsAction

    action DeleteVisitAction { visitId } = do
        visit <- fetch visitId
        deleteRecord visit
        setSuccessMessage "Visit deleted"
        redirectTo VisitsAction

buildVisit visit = visit
    |> fill @'["body"]
