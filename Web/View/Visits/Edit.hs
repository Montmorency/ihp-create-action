module Web.View.Visits.Edit where
import Web.View.Prelude

data EditView = EditView { visit :: Visit }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={VisitsAction}>Visits</a></li>
                <li class="breadcrumb-item active">Edit Visit</li>
            </ol>
        </nav>
        <h1>Edit Visit</h1>
        {renderForm visit}
    |]

renderForm :: Visit -> Html
renderForm visit = formFor visit [hsx|

    {submitButton}
|]
