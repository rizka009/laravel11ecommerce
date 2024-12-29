<ul class="account-nav">
    <li><a href="{{ route('user.index') }}" class="menu-link menu-link_us-s">Dashboard</a></li>
    <li><a href="{{ route('user.orders') }}" class="menu-link menu-link_us-s">Orders</a></li>
    <li><a href="account-address.html" class="menu-link menu-link_us-s">Addresses</a></li>
    <li><a href="{{ route('user.account.details') }}" class="menu-link menu-link_us-s">Account Details</a></li>
    <li><a href="{{ route('wishlist.index') }}" class="menu-link menu-link_us-s">Wishlist</a></li>

    <li>
        <form method="POST" action="{{ route('logout') }}" id="logout-form">
            @csrf
            <a href="{{ route('logout') }}" class="menu-link menu-link_us-s" onclick="event.preventDefault();document.getElementById('logout-form').submit();">Logout</a>
        </form>
    </li>

    <div class="col-lg-9">
        <div class="page-content my-account__edit">
            <div class="my-account__edit-form">
                <form name="account_edit_form" action="{{ route('user.account.update') }}" method="POST" class="needs-validation" novalidate="">
                    @csrf
                    <!-- Form fields here -->
                </form>
            </div>
        </div>
    </div>
  </ul>
