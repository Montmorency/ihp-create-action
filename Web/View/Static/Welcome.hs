module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView {client :: Client}

instance View WelcomeView where
    html WelcomeView {..} = [hsx|
         <p> Hi Client {get #name client} </p>
         <p> <a href={NewVisitAction (get #id client)}> Make A New Booking </a> </p>
|]
