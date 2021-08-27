module Web.View.Visits.Index where
import Web.View.Prelude

data IndexView = IndexView { visits :: [Visit] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={VisitsAction}>Visits</a></li>
            </ol>
        </nav>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Visit</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach visits renderVisit}</tbody>
            </table>
        </div>
    |]


renderVisit :: Visit -> Html
renderVisit visit = [hsx|
    <tr>
        <td>{visit}</td>
        <td><a href={EditVisitAction (get #id visit)} class="text-muted">Edit</a></td>
        <td><a href={DeleteVisitAction (get #id visit)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
