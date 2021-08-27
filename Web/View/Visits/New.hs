module Web.View.Visits.New where
import Web.View.Prelude

data NewView = NewView { client :: Client
                       , visit :: Visit
                       }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={VisitsAction}>Visits</a></li>
                <li class="breadcrumb-item active">New Visit</li>
            </ol>
        </nav>
        <h1>New Visit</h1>
        {renderForm visit}
    |]

renderForm :: Visit -> Html
renderForm visit = formFor visit [hsx|
    {textField #body}
    {hiddenField #clientId}
    {submitButton}
|]
