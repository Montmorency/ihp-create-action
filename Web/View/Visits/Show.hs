module Web.View.Visits.Show where
import Web.View.Prelude

data ShowView = ShowView { visit :: Visit }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={VisitsAction}>Visits</a></li>
                <li class="breadcrumb-item active">Show Visit</li>
            </ol>
        </nav>
        <h1>Show Visit</h1>
        <p>{visit}</p>
    |]
