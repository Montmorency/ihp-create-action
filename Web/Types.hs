module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data ClientsController
    = ClientsAction
    | NewClientAction
    | ShowClientAction { clientId :: !(Id Client) }
    | CreateClientAction
    | EditClientAction { clientId :: !(Id Client) }
    | UpdateClientAction { clientId :: !(Id Client) }
    | DeleteClientAction { clientId :: !(Id Client) }
    deriving (Eq, Show, Data)

data VisitsController
    = VisitsAction
    | NewVisitAction { clientId :: !(Id Client) }
    | ShowVisitAction { visitId :: !(Id Visit) }
    | CreateVisitAction
    | EditVisitAction { visitId :: !(Id Visit) }
    | UpdateVisitAction { visitId :: !(Id Visit) }
    | DeleteVisitAction { visitId :: !(Id Visit) }
    deriving (Eq, Show, Data)
