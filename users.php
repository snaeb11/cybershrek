<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cambay:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/user.css">
    <title>User Settings</title>
</head>
<body>
    <nav class="navbar" id="navbar">
        <ul>
            <li>
                <span class="logo">
                    <img src="resources/small-Vector.svg" alt="jais. logo" id="jais-logo" width="65" height="65">
                </span>
                <button onclick="toggleSidebar()" id="toggle-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z"/>
                    </svg>
                </button>
            </li>
            <li>
                <a href="inventory.php">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/>
                    </svg>
                    <span>Inventory</span>
                </a>
            </li>
            <li class="active">
                <a href="#">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z"/>
                    </svg>
                    <span>User Settings</span>
                </a>
            </li>
            <li>
                <!--LOGS-->
                <a href="logs.html">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M760-200v-120H200v120h560Zm0-200v-160H200v160h560Zm0-240v-120H200v120h560ZM200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Z"/></svg>
                    <span>Logs</span>
                </a>
            </li>
            <li>
                <a href="javascript:void(0)" onclick="logout()" id="logout-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed">
                        <path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/>
                    </svg>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </nav>

    <main>
        <div class="container">
            <div class="textWrapper">
                <p class="text" id="roles">Roles</p>
                <p class="text" id="mod">Modify user's access rights</p>
            </div>

            <div class="tableWrapper">
                <table class="table" id="userTable">
                    <thead>
                        <tr>
                            <th>Account Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>

        <div id="popup" class="popup">
            <div class="popup-content">
                <h2>Modify User</h2>
                <h3 id="userInfo">Name: </h3>
                <table class="popup-table">
                    <thead>
                        <tr>
                            <th>Access</th>
                            <th>Read</th>
                            <th>Add</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="inventoryRow">
                            <td>Inventory Management</td>
                            <td><input type="checkbox" class="read" id="inv-read"></td>
                            <td><input type="checkbox" class="add" id="inv-add"></td>
                            <td><input type="checkbox" class="update" id="inv-ipd"></td>
                            <td><input type="checkbox" class="delete" id="inv-del"></td>
                        </tr>
                    </tbody>
                    <thead>
                        <tr>
                            <th>Access</th>
                            <th>Admin</th>
                            <th>Clerk</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="accountRow">
                            <td>Account Management</td>
                            <td><input type="checkbox" class="admin" id="acc-admin"></td>
                            <td><input type="checkbox" class="clerk" id="acc-clerk"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="popup-actions">
                    <button id="cancelButton" class="cancel">Cancel</button>
                    <button class="save" onclick="save()">Save</button>
                </div>
            </div>
        </div>        
    </main>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script defer>
        const popup = document.getElementById('popup');
        const cancelButton = document.getElementById('cancelButton');

        let rolesData = [];

        document.addEventListener('DOMContentLoaded', () => {
            fetch('get_accounts.php')
                .then(response => response.json())
                .then(accounts => {
                    const tableBody = document.querySelector("#userTable tbody");
                    tableBody.innerHTML = '';

                    accounts.forEach(account => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${account.firstName} ${account.lastName}</td>
                            <td>
                                <button class="action-btn" data-user-id="${account.userId}"><span>Modify</span></button>
                            </td>
                        `;
                        tableBody.appendChild(row);
                    });

                    attachModifyListeners();
                });
        });

        function showPopup(userId) {
            const inventoryRow = document.getElementById('inventoryRow').querySelectorAll('input');
            const accountRow = document.getElementById('accountRow').querySelectorAll('input');

            [...inventoryRow, ...accountRow].forEach(input => (input.checked = false));

            // Save the userId to the popup for reference during save
            document.getElementById('popup').setAttribute('data-user-id', userId);

            fetch(`get_users_permissions.php?userId=${userId}`)
                .then((response) => response.json())
                .then((data) => {
                    userInfo.innerText = `Name: ${data.firstName} ${data.lastName}`;

                    const permissionList = data.permissions.split(',').map((perm) => perm.trim());

                    inventoryRow[0].checked = permissionList.includes('inventory:view');
                    inventoryRow[1].checked = permissionList.includes('inventory:add');
                    inventoryRow[2].checked = permissionList.includes('inventory:edit');
                    inventoryRow[3].checked = permissionList.includes('inventory:delete');

                    accountRow[0].checked = permissionList.includes('manage:admin');
                    accountRow[1].checked = permissionList.includes('manage:clerk');

                    popup.style.display = 'block';
                })
                .catch((error) => console.error('Error fetching user permissions:', error));
        }

        function attachModifyListeners() {
            const modifyButtons = document.querySelectorAll('.action-btn');
            modifyButtons.forEach(button => {
                button.addEventListener('click', () => {
                    const userId = button.dataset.userId;
                    showPopup(userId);
                });
            });
        }



        document.getElementById('cancelButton').addEventListener('click', () => {
            document.getElementById('popup').style.display = 'none';
        });


        function save() {
            const userId = document.getElementById('popup').getAttribute('data-user-id');

            const permissions = [];

            const inventoryRow = document.getElementById('inventoryRow').querySelectorAll('input');
            const accountRow = document.getElementById('accountRow').querySelectorAll('input');

            if (inventoryRow[0].checked) permissions.push('inventory:view');
            if (inventoryRow[1].checked) permissions.push('inventory:add');
            if (inventoryRow[2].checked) permissions.push('inventory:edit');
            if (inventoryRow[3].checked) permissions.push('inventory:delete');

            if (accountRow[0].checked) permissions.push('manage:admin');
            if (accountRow[1].checked) permissions.push('manage:clerk');

            console.log('Permissions:', permissions);

            Swal.fire({
                title: 'Confirm Save',
                text: `Are you sure you want to save these changes?\nPermissions: ${permissions.join(', ')}\nFor: ${userInfo.innerText.replace('Name: ', '')}`,
                icon: 'question',
                showCancelButton: true,
                confirmButtonColor: '#9F6D45',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, Save',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    console.log("works here");
                    fetch('save_user_permissions.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify({ userId, permissions })
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log("Save response:", data);
                
                        if (data.status === 'success') {
                            console.log("Saved Permissions:", permissions);
                            console.log("Saved for UserId:", userId);
                            
                            Swal.fire('Saved!', data.message, 'success');
                            popup.style.display = 'none';
                        } else {
                            Swal.fire('Error!', data.message, 'error');
                        }
                    })
                    .catch(error => {
                        console.error('Error saving permissions:', error);
                        Swal.fire('Error!', 'An error occurred while saving permissions.', 'error');
                    });
                }
            });
        }



        function logout() {
            Swal.fire({
                title: 'Logout',
                text: 'Are you sure you want to logout?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#d33',
                cancelButtonColor: '#9F6D45',
                confirmButtonText: 'Logout',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = 'index.html';
                }
            });
        }
    </script>
</body>
</html>
