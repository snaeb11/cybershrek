<?php
session_start();
require_once 'config/db_connection.php';

function fetchUserPermissions($userId) {
    global $conn;

    $stmt = $conn->prepare("SELECT firstName, accType, permission FROM accounts WHERE userId = ?");
    $stmt->bind_param("i", $userId);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        return $result->fetch_assoc(); // Returns an associative array with user details
    }

    return null;
}

// Check if the user is logged in
if (isset($_SESSION['user']['userId'])) {
    $userId = $_SESSION['user']['userId'];

    // Fetch user details
    $userDetails = fetchUserPermissions($userId);

    if ($userDetails) {
        // Extract the required details from the associative array
        $firstName = $userDetails['firstName'];
        $accType = $userDetails['accType'];
        $permissions = explode(', ', $userDetails['permission']);

        // Define permissions
        $canViewInventory = in_array('inventory:view', $permissions);
        $canAddInventory = in_array('inventory:add', $permissions);
        $canEditInventory = in_array('inventory:edit', $permissions);
        $canDeleteInventory = in_array('inventory:delete', $permissions);
        $canManageView = in_array('manage:view', $permissions);
        $canManageEdit = in_array('manage:edit', $permissions);

        echo "<script>
            var userId = " . json_encode($userId) . ";
            var canViewInventory = " . ($canViewInventory ? 'true' : 'false') . ";
            var canAddInventory = " . ($canAddInventory ? 'true' : 'false') . ";
            var canEditInventory = " . ($canEditInventory ? 'true' : 'false') . ";
            var canDeleteInventory = " . ($canDeleteInventory ? 'true' : 'false') . ";
            var canManageView = " . ($canManageView ? 'true' : 'false') . ";
            var canManageEdit = " . ($canManageEdit ? 'true' : 'false') . ";
            console.log('User ID:', userId);
            console.log('Permissions:', { canViewInventory, canAddInventory , canEditInventory, canDeleteInventory, canManageView, canManageEdit });

        </script>";
    } else {
        echo "<script>
            console.log('Failed to fetch user details');
        </script>";
    }
} else {
    echo "<script>
        console.log('User is not logged in');
    </script>";
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
    <link rel="stylesheet" href="lib/datatables/dataTables.css">
    <link rel="stylesheet" href="css/inventory.css">
    <title>Inventory</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
    <nav class="navbar" id="navbar">
        <ul>
            <li>
                <!--jais.-->
                <span class="logo">
                    <img src="resources/small-Vector.svg" alt="jais. logo" id="jais-logo" width="65" height="65">
                </span>
                <button onclick=toggleSidebar() id="toggle-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="m313-480 155 156q11 11 11.5 27.5T468-268q-11 11-28 11t-28-11L228-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T468-692q11 11 11 28t-11 28L313-480Zm264 0 155 156q11 11 11.5 27.5T732-268q-11 11-28 11t-28-11L492-452q-6-6-8.5-13t-2.5-15q0-8 2.5-15t8.5-13l184-184q11-11 27.5-11.5T732-692q11 11 11 28t-11 28L577-480Z"/></svg>
                </button>
            </li>
            <li class="active">
                <!--INVENTORY-->
                <a href="inventory.php">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M200-80q-33 0-56.5-23.5T120-160v-451q-18-11-29-28.5T80-680v-120q0-33 23.5-56.5T160-880h640q33 0 56.5 23.5T880-800v120q0 23-11 40.5T840-611v451q0 33-23.5 56.5T760-80H200Zm0-520v440h560v-440H200Zm-40-80h640v-120H160v120Zm200 280h240v-80H360v80Zm120 20Z"/></svg>
                    <span>Inventory</span>
                </a>
            </li>
            <li>
                <!--USER SETTING-->
                <a href="users.php">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z"/></svg>
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
                <!--LOGOUT-->
                <a href="javascript:void(0)" onclick="logout()" id="logout-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#e8eaed"><path d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z"/></svg>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </nav>

    <main>
        <div class="titleInventory">
            <p class="text" id="inventoryTitle">Inventory</p>
        </div>
    
        <div class="wrapper">
            <div class="tableContent">
                <table id="myTable" class="display">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!--dynamically generated from database -->
                    </tbody>
                </table>
                <button class="cssbuttons-io-button"  id="addItemButton">
                    Add Item
                    <div class="icon">
                        <svg
                          height="24"
                          width="24"
                          viewBox="0 0 24 24"
                          xmlns="http://www.w3.org/2000/svg"
                        >
                          <path d="M0 0h24v24H0z" fill="none"></path>
                          <path
                            d="M12 5v14m-7-7h14"
                            stroke="currentColor"
                            stroke-width="2"
                            fill="none"
                            stroke-linecap="round"
                          ></path>
                        </svg>
                      </div>                  
                  </button>
            </div>
        </div>
    </main>
    <script src="lib/jQuery/jquery-3.7.1.min.js"></script>
    <script src="lib/datatables/dataTables.js"></script>

    <script defer>
        // Permission handler utility
        class PermissionHandler {
            constructor() {
                // Store permissions from PHP session
                this.permissions = {
                    canView: typeof canViewInventory !== 'undefined' ? canViewInventory : false,
                    canEdit: typeof canEditInventory !== 'undefined' ? canEditInventory : false,
                    canDelete: typeof canDeleteInventory !== 'undefined' ? canDeleteInventory : false,
                    canAdd: typeof canAddInventory !== 'undefined' ? canAddInventory : false,
                    canManageView: typeof canManageView !== 'undefined' ? canManageView : false,
                    canManageEdit: typeof canManageEdit !== 'undefined' ? canManageEdit : false
                };
                
                // Initialize permission checks
                this.init();
            }

            init() {
                // Check if user is logged in
                if (typeof userId === 'undefined') {
                    console.log('User not logged in, redirecting...');
                    window.location.href = 'login.html';
                    return;
                }

                this.hideRestrictedMenuItems();
                if (!this.permissions.canView) {
                    this.hideInventoryTable();
                } else {
                    this.setupEventListeners();
                    this.applyPermissions();
                }
            }

            hideRestrictedMenuItems() {
                const userSettingsMenu = document.querySelector('li a[href="users.php"]');
                const logsMenu = document.querySelector('li a[href="logs.html"]');
                const accLogs = document.querySelector('li a[href="accCreationLogs.html"]');
                
                // Hide "User Settings" if the user does not have manage:view or manage:edit permission
                if (userSettingsMenu && !(this.permissions.canManageEdit || this.permissions.canManageView)) {
                    userSettingsMenu.parentElement.style.display = 'none';
                }
                
                // Hide "Logs" if the user does not have manage:admin permission
                if ((logsMenu && accLogs) && !this.permissions.canManageView) {
                    logsMenu.parentElement.style.display = 'none';
                    accLogs.parentElement.style.display = 'none';
                }
            }

            setupEventListeners() {
                // Watch for dynamic table changes
                const tableBody = document.querySelector('#myTable tbody');
                if (tableBody) {
                    const observer = new MutationObserver(() => this.applyPermissions());
                    observer.observe(tableBody, { 
                        childList: true, 
                        subtree: true 
                    });
                }
            }

            applyPermissions() {
                // Handle Add button
                const addButton = document.getElementById('addItemButton');
                if (addButton) {
                    addButton.style.display = this.permissions.canAdd ? 'flex' : 'none';
                }

                // Handle Edit and Delete buttons
                const rows = document.querySelectorAll('#myTable tbody tr');
                rows.forEach(row => {
                    const actionCell = row.querySelector('td:last-child');
                    if (actionCell) {
                        const editButton = actionCell.querySelector('.edit-btn');
                        const deleteButton = actionCell.querySelector('.delete-btn');

                        if (editButton) {
                            editButton.style.display = this.permissions.canEdit ? 'inline-block' : 'none';
                        }
                        if (deleteButton) {
                            deleteButton.style.display = this.permissions.canDelete ? 'inline-block' : 'none';
                        }
                    }
                });
            }

            hideInventoryTable() {
                const tableContainer = document.querySelector('.tableContent');
                const message = document.createElement('p');
                message.textContent = "You have no permission to view the inventory";
                message.style.textAlign = 'center';
                message.style.fontSize = '20px';
                tableContainer.innerHTML = '';
                tableContainer.appendChild(message);
            }

            checkPermission(action) {
                switch (action) {
                    case 'add':
                        return this.permissions.canAdd;
                    case 'edit':
                        return this.permissions.canEdit;
                    case 'delete':
                        return this.permissions.canDelete;
                    default:
                        return false;
                }
            }
        }

        // Utility Functions
        function sanitizeInput(input) {
            input = input.replace(/<\/?[^>]+(>|$)/g, "");
            const temp = document.createElement('div');
            temp.textContent = input.trim();
            return temp.innerHTML;
        }

        // Initialize permission handler when DOM is loaded
        document.addEventListener('DOMContentLoaded', function() {
            window.permissionHandler = new PermissionHandler();
            
            // Only add event listener if user has 'add' permission
            const addItemButton = document.querySelector('.cssbuttons-io-button');
            if (addItemButton && window.permissionHandler.checkPermission('add')) {
                addItemButton.addEventListener('click', () => {
                    Swal.fire({
                        title: 'Add New Item',
                        html: `
                            <input type="text" id="productName" class="swal2-input" placeholder="Product Name">
                            <input type="text" id="category" class="swal2-input" placeholder="Category">
                            <input type="number" id="qty" class="swal2-input" placeholder="Quantity">
                            <input type="number" step="0.01" id="price" class="swal2-input" placeholder="Price">
                        `,
                        confirmButtonText: 'Submit',
                        confirmButtonColor: '#9F6D45',
                        showCancelButton: true,
                        preConfirm: () => {
                            const productName = sanitizeInput(document.getElementById('productName').value);
                            const category = sanitizeInput(document.getElementById('category').value);
                            const qty = sanitizeInput(document.getElementById('qty').value);
                            const price = sanitizeInput(document.getElementById('price').value);

                            if (!productName || !category || !qty || !price) {
                                Swal.showValidationMessage('Please fill in all fields');
                                return false;
                            }

                            return { productName, category, qty, price };
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            const formData = new FormData();
                            formData.append('productName', result.value.productName);
                            formData.append('category', result.value.category);
                            formData.append('qty', result.value.qty);
                            formData.append('price', result.value.price);

                            fetch('add_bread.php', {
                                method: 'POST',
                                body: formData
                            })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    Swal.fire('Success', data.message, 'success');
                                    location.reload();
                                } else {
                                    Swal.fire('Error', data.message, 'error');
                                }
                            })
                            .catch(error => {
                                Swal.fire('Error', 'Failed to add item.', 'error');
                                console.error(error);
                            });
                        }
                    });
                });
            }
        });

        // Initialize DataTable and Load Data
        $(document).ready(function() {
            // Only fetch data if the user has 'view' permission
            if (canViewInventory) {
                fetch('display_bread.php')
                    .then(response => response.json())
                    .then(data => {
                        const tableBody = document.querySelector('#myTable tbody');
                        data.forEach(product => {
                            const row = document.createElement('tr');
                            row.innerHTML = `
                                <td>${product.productId}</td>
                                <td>${product.productName}</td>
                                <td>${product.category}</td>
                                <td>${product.qty}</td>
                                <td>${product.price}</td>
                                <td>
                                    <button class="edit-btn" id="act-edit-btn" data-id="${product.productId}"><span>Edit</span></button>
                                    <button class="delete-btn" data-id="${product.productId}"><span>Delete</span></button>
                                </td>
                            `;
                            tableBody.appendChild(row);
                        });

                        if (!$.fn.DataTable.isDataTable('#myTable')) {
                            $('#myTable').DataTable();
                        }
                    })
                    .catch(error => {
                        console.error('Error fetching inventory data:', error);
                    });
            } else {
                // Optionally show a message if the user does not have permission to view
                const tableContainer = document.querySelector('.tableContent');
                const message = document.createElement('p');
                message.textContent = "You do not have permission to view the inventory.";
                message.style.textAlign = 'center';
                message.style.fontSize = '20px';
                tableContainer.innerHTML = '';
                tableContainer.appendChild(message);
            }
        });

        // Edit Button Handler
        $(document).on('click', '.edit-btn', function() {
            if (!window.permissionHandler.checkPermission('edit')) {
                Swal.fire({
                    title: 'Permission Denied',
                    text: 'You do not have permission to edit items.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
                return;
            }

            const productId = $(this).data('id');
            const row = $(this).closest('tr');
            const productName = row.find('td:eq(1)').text();
            const category = row.find('td:eq(2)').text();
            const qty = row.find('td:eq(3)').text();
            const price = row.find('td:eq(4)').text();
            
            Swal.fire({
                title: 'Edit Product',
                html: `
                    <input type="text" id="editProductName" class="swal2-input" placeholder="Product Name" value="${productName}">
                    <input type="text" id="editCategory" class="swal2-input" placeholder="Category" value="${category}">
                    <input type="number" id="editQty" class="swal2-input" placeholder="Quantity" value="${qty}">
                    <input type="number" step="0.01" id="editPrice" class="swal2-input" placeholder="Price" value="${price}">
                `,
                confirmButtonText: 'Update',
                confirmButtonColor: '#9F6D45',
                showCancelButton: true,
                preConfirm: () => {
                    const productName = sanitizeInput(document.getElementById('editProductName').value);
                    const category = sanitizeInput(document.getElementById('editCategory').value);
                    const qty = sanitizeInput(document.getElementById('editQty').value);
                    const price = sanitizeInput(document.getElementById('editPrice').value);

                    if (!productName || !category || !qty || !price) {
                        Swal.showValidationMessage('Please fill in all fields');
                        return false;
                    }

                    return { productId, productName, category, qty, price };
                }
            }).then(result => {
                if (result.isConfirmed) {
                    const formData = new FormData();
                    formData.append('productId', result.value.productId);
                    formData.append('productName', result.value.productName);
                    formData.append('category', result.value.category);
                    formData.append('qty', result.value.qty);
                    formData.append('price', result.value.price);

                    fetch('update_bread.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire('Success', 'Product updated successfully.', 'success');
                            location.reload();
                        } else {
                            Swal.fire('Error', data.message, 'error');
                        }
                    })
                    .catch(error => {
                        Swal.fire('Error', 'Failed to update item.', 'error');
                        console.error(error);
                    });
                }
            });
        });

        // Delete Button Handler
        $(document).on('click', '.delete-btn', function() {
            if (!window.permissionHandler.checkPermission('delete')) {
                Swal.fire({
                    title: 'Permission Denied',
                    text: 'You do not have permission to delete items.',
                    icon: 'error',
                    confirmButtonText: 'OK'
                });
                return;
            }

            const productId = $(this).data('id');

            Swal.fire({
                title: 'Are you sure?',
                text: `You are about to delete product ID: ${productId}. This action cannot be undone.`,
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Delete',
                cancelButtonText: 'Cancel',
                confirmButtonColor: '#d33',
                cancelButtonColor: '#9F6D45'
            }).then((result) => {
                if (result.isConfirmed) {
                    const formData = new FormData();
                    formData.append('productId', productId);

                    fetch('delete_bread.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            Swal.fire('Deleted!', 'The product has been deleted successfully.', 'success')
                                .then(() => location.reload());
                        } else {
                            throw new Error(data.message || 'Failed to delete product.');
                        }
                    })
                    .catch(error => {
                        Swal.fire('Error', error.message, 'error');
                        console.error(error);
                    });
                }
            });
        });

        // Sidebar Toggle
        function toggleSidebar() {
            const navbar = document.getElementById('navbar');
            const toggleButton = document.getElementById('toggle-btn');
            navbar.classList.toggle('close');
            toggleButton.classList.toggle('rotate');
        }

        // Logout Function
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