<?php
    session_start();
    require_once 'config/db_connection.php';

    function fetchUserPermissions($userId) {
        global $conn;
        
        $stmt = $conn->prepare("SELECT permission FROM accounts WHERE userId = ?");
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();
            return explode(', ', $user['permission']); 
        }
        
        return []; 
    }

    // Check if the user is logged in
    if (isset($_SESSION['user']['userId'])) {
        $userId = $_SESSION['user']['userId'];
        $permissions = fetchUserPermissions($userId);
    
        $canManageView = in_array('manage:view', $permissions);
        $canManageEdit = in_array('manage:edit', $permissions);
    
        echo "<script>
            var userId = " . json_encode($userId) . ";
            var canManageView = " . ($canManageView ? 'true' : 'false') . ";
            var canManageEdit = " . ($canManageEdit ? 'true' : 'false') . ";
        </script>";
    } else {
        echo "<script>console.log('User is not logged in');</script>";
    }    
?>

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
                    <span>Activity Logs</span>
                </a>
            </li>
            <li>
                <!--ACCOUNT CREATION LOGS-->
                <a href="accCreationLogs.html">
                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M760-200v-120H200v120h560Zm0-200v-160H200v160h560Zm0-240v-120H200v120h560ZM200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h560q33 0 56.5 23.5T840-760v560q0 33-23.5 56.5T760-120H200Z"/></svg>
                    <span>Account Creation Logs</span>
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
                            <th>Account Type</th>
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
                <h3 id="userType">Account Type: </h3>
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
                        <tr id="accountRow">
                            <td>Account Management</td>
                            <td><input type="checkbox" class="read" id="acc-read"></td>
                            <td><input type="checkbox" class="add" id="acc-add" style="visibility: hidden;"></td>
                            <td><input type="checkbox" class="update" id="acc-ipd"></td>
                            <td><input type="checkbox" class="delete" id="acc-del" style="visibility: hidden;"></td>
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
        class PermissionHandler {
            constructor() {
                this.permissions = {
                    canManageView: typeof canManageView !== 'undefined' ? canManageView : false,
                    canManageEdit: typeof canManageEdit !== 'undefined' ? canManageEdit : false
                };

                this.init();
            }

            init() {
                if (typeof userId === 'undefined') {
                    console.log('User not logged in, redirecting...');
                    window.location.href = 'login.html';
                    return;
                }

                if (!this.permissions.canManageView) {
                    this.showNoPermissionsMessage();
                } else {
                }
            }

            showNoPermissionsMessage() {
                const container = document.querySelector('.container');
                const message = document.createElement('p');
                message.textContent = "You do not have permissions to view the accounts.";
                message.style.textAlign = 'center';
                message.style.fontSize = '20px';
                message.style.color = 'red';

                container.innerHTML = '';
                container.appendChild(message);
            }
        }

        document.addEventListener('DOMContentLoaded', () => new PermissionHandler());

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
                        // Only show the Modify button if user has manage:edit permission
                        const actionButton = canManageEdit ? 
                            `<button class="action-btn" data-user-id="${account.userId}"><span>Modify</span></button>` : 
                            '';
                        
                        row.innerHTML = `
                            <td>${account.firstName} ${account.lastName}</td>
                            <td>${account.accType}</td>
                            <td>${actionButton}</td>
                        `;
                        tableBody.appendChild(row);
                    });

                    // Only attach listeners if manage:edit permission exists
                    if (canManageEdit) {
                        attachModifyListeners();
                    }
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
                    userType.innerText = `Account Type: ${data.accType}`;

                    const permissionList = data.permissions.split(',').map((perm) => perm.trim());

                    inventoryRow[0].checked = permissionList.includes('inventory:view');
                    inventoryRow[1].checked = permissionList.includes('inventory:add');
                    inventoryRow[2].checked = permissionList.includes('inventory:edit');
                    inventoryRow[3].checked = permissionList.includes('inventory:delete');

                    accountRow[0].checked = permissionList.includes('manage:view');
                    accountRow[1].checked = permissionList.includes('manage:add');
                    accountRow[2].checked = permissionList.includes('manage:edit');
                    accountRow[3].checked = permissionList.includes('manage:delete');

                    popup.style.display = 'flex';
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
            const inventoryRow = document.getElementById('inventoryRow').querySelectorAll('input');
            const accountRow = document.getElementById('accountRow').querySelectorAll('input');

            // Collect permissions as an array
            const permissions = [];

            // Inventory permissions
            if (inventoryRow[0].checked) permissions.push('inventory:view');
            if (inventoryRow[1].checked) permissions.push('inventory:add');
            if (inventoryRow[2].checked) permissions.push('inventory:edit');
            if (inventoryRow[3].checked) permissions.push('inventory:delete');

            // Account permissions
            if (accountRow[0].checked) permissions.push('manage:view');
            if (accountRow[2].checked) permissions.push('manage:edit');

            // Determine account type based on permissions
            let newAccType = 'Clerk'; // Default account type

            if (permissions.includes('manage:view') ||
                permissions.includes('manage:edit')) {
                newAccType = 'Admin';
                Swal.fire({
                    title: "Promotion to Admin",
                    text: "You are giving account management permissions. This will promote them to Admin.",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, promote",
                }).then((result) => {
                    if (result.isConfirmed) {
                        updatePermissions(userId, permissions, newAccType);
                    }
                });
            } else if ((permissions.includes('manage:view') ||
                permissions.includes('manage:edit')) && (
                permissions.includes('inventory:add') || 
                permissions.includes('inventory:edit') || 
                permissions.includes('inventory:delete'))) {
                newAccType = 'Admin';
                Swal.fire({
                    title: "Promotion to Admin",
                    text: "You are giving account management permissions. This will promote them to Admin.",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, promote",
                }).then((result) => {
                    if (result.isConfirmed) {
                        updatePermissions(userId, permissions, newAccType);
                    }
                });
            } else if (
                permissions.includes('inventory:add') || 
                permissions.includes('inventory:edit') || 
                permissions.includes('inventory:delete')
            ) {
                newAccType = 'Stockman';
                Swal.fire({
                    title: "Promotion to Stockman",
                    text: "You are giving inventory management permissions. This will promote them to Stockman.",
                    icon: "warning",
                    showCancelButton: true,
                    confirmButtonText: "Yes, promote",
                }).then((result) => {
                    if (result.isConfirmed) {
                        updatePermissions(userId, permissions, newAccType);
                    }
                });
            } else {
                updatePermissions(userId, permissions, newAccType);
            }
        }

        function updatePermissions(userId, permissions, newAccType) {
            console.log("works here upd");

            const payload = {
                userId: userId,
                permissions: permissions,  // Send the array directly
                accType: newAccType
            };

            console.log('Sending payload:', payload);

            fetch("update_permission.php", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(payload),
                credentials: 'include'  // Include session cookies
            })
            .then(response => {
                console.log('Response status:', response.status);
                if (!response.ok) {
                    return response.text().then(text => {
                        console.error('Error response:', text);
                        throw new Error(`HTTP error! status: ${response.status}`);
                    });
                }
                return response.json();
            })
            .then(result => {
                console.log('Success result:', result);
                    if (result.status === 'success') {
                        Swal.fire("Saved!", result.message, "success")
                        .then(() => {
                            document.getElementById("popup").style.display = "none";
                            location.reload();
                        });
                    } else {
                        // In case the response doesn't indicate success, treat it as an error
                        throw new Error(result.message || "Failed to update permissions.");
                    }
            })
            .catch(error => {
                console.error("Error:", error);
                Swal.fire("Error", error.message || "An unexpected error occurred.", "error");
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
                    fetch('logout.php', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire({
                                title: 'Logged Out!',
                                text: 'You have been successfully logged out',
                                icon: 'success',
                                timer: 1500,
                                timerProgressBar: true,
                                showConfirmButton: false
                            }).then(() => {
                                window.location.href = 'login.html';
                            });
                        } else {
                            throw new Error(data.message || 'Logout failed');
                        }
                    })
                    .catch(error => {
                        console.error('Logout error:', error);
                        Swal.fire({
                            title: 'Error',
                            text: 'An error occurred during logout',
                            icon: 'error'
                        });
                    });
                }
            });
        }
    </script>
</body>
</html>
