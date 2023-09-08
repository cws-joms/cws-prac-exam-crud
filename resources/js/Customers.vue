<template>
    <div class="container">
        <h2 class="mb-2">{{ displayActionLabel }} Customer</h2>
        <div class="row mb-4">
            <div class="col-12">
                <form @submit.prevent="save">
                    <div class="form-group">
                        <label>First name</label>
                        <input type="text" v-model="customer.first_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Middle name</label>
                        <input type="text" v-model="customer.middle_name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Last name</label>
                        <input type="text" v-model="customer.last_name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" v-model="customer.birth_date" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Gender</label>
                        <select v-model="customer.gender" class="form-control" required>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="role">Marital status</label>
                        <select v-model="customer.marital_status" class="form-control" required>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Widowed">Widowed</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary mt-2">Save</button>
                </form>
            </div>
        </div>
        <h2 class="mb-2">Manage Customers</h2>
        <table class="table table-bordered table-light mt-2">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Full name</th>
                    <th scope="col">Date of Birth</th>
                    <th scope="col">Age</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Marital status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody v-if="result.length">
                <tr v-for="(customer, index) in result" v-bind:key="customer.id">
                    <td>{{ customer.id }}</td>
                    <td>{{ customer.first_name }} {{ customer.middle_name }} {{ customer.last_name }}</td>
                    <td>{{ customer.birth_date }}</td>
                    <td>{{ calculateAge(customer.birth_date) }}</td>
                    <td>{{ customer.gender }}</td>
                    <td>{{ customer.marital_status }}</td>
                    <td>
                        <button type="button" class="btn btn-warning mx-2" @click="edit(customer)">Edit</button>
                        <button type="button" class="btn btn-danger" @click="remove(customer)">Delete</button>
                        <button type="button" class="btn btn-secondary mx-2" @click="viewTransactions(customer)">View
                            Transactions</button>
                        <button type="button" class="btn btn-primary mx-2" @click="addTransactions(customer, index)">Add
                            Transactions</button>
                    </td>
                    <div class="card" v-if="showAddTransactionCard[index]">
                        <div class="card-body">
                            <form @submit.prevent="saveTransaction">
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input type="text" v-model="transaction.product_name" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="number" v-model="transaction.quantity" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Unit Price</label>
                                    <input type="number" v-model="transaction.unit_price" class="form-control" required>
                                </div>

                                <button type="submit" class="btn btn-primary mt-2">Save</button>
                            </form>
                        </div>
                    </div>
                </tr>
            </tbody>
            <div class="row" v-else>
                <div class="col">
                    <p class="text-center">No results found.</p>
                </div>
            </div>
        </table>
    </div>
</template>

<script>
export default {
    name: 'CustomersView',
    data() {
        return {
            result: {},
            customer: {
                id: '',
                first_name: '',
                last_name: '',
                middle_name: '',
                birth_date: '',
                gender: '',
                marital_status: '',
                is_deleted: 0,
            },
            transaction: {
                customer_id: '',
                reference_id: '',
                product_name: '',
                quantity: 0,
                unit_price: 0,
            },
            actionLabel: '',
            showAddTransactionCard: []
        }
    },
    created() {

    },
    mounted() {
        this.fetchCustomerDetails()
        this.showAddTransactionCard = new Array(this.result.length).fill(false);
    },
    computed: {
        calculateAge() {

            return (birthDate) => {
                if (!birthDate) return '';

                const birthDateObj = new Date(birthDate);
                const currentDate = new Date();
                const age = currentDate.getFullYear() - birthDateObj.getFullYear();

                if (
                    currentDate.getMonth() < birthDateObj.getMonth() ||
                    (currentDate.getMonth() === birthDateObj.getMonth() &&
                        currentDate.getDate() < birthDateObj.getDate())
                ) {
                    return age - 1;
                }

                return age;
            };
        },
        displayActionLabel() {
            return this.actionLabel === '' ? 'Add' : this.actionLabel;
        },
    },
    methods: {
        fetchCustomerDetails() {

            axios.get('/customers')
                .then((response) => {

                    console.log(response.data);
                    this.result = response.data;
                })
                .catch((error) => {

                    console.error('Error fetching customer details:', error);
                });
        },
        save() {
            if (this.customer.id == '') {
                this.saveData();
            }
            else {
                this.updateData();
            }

        },
        saveData() {
            axios.post("/save_customer", this.customer)
                .then(
                    ({ data }) => {
                        alert("New customer saved!");
                        this.fetchCustomerDetails();
                    }
                ).catch((error) => {
                    console.error('Error saving customer:', error);
                    alert('Failed to save customer.');
                });

        },
        edit(customer) {

            this.actionLabel = 'Edit';
            this.customer = customer;
        },
        updateData() {

            var editrecords = '/update_customer/' + this.customer.id;
            axios.put(editrecords, this.customer)
                .then(
                    ({ data }) => {
                        this.customer.first_name = '',
                        this.customer.middle_name = '',
                        this.customer.last_name = '',
                        this.customer.birth_date = '',
                        this.customer.gender = '',
                        this.customer.marital_status = ''

                        alert("Info successfully updated!");
                        this.fetchCustomerDetails();
                    }
                ).catch((error) => {
                    console.error('Error updating data:', error);
                    alert('Failed to update customer.');
                });

        },
        remove(customer) {

            if (confirm('Are you sure you want to delete this customer?')) {

                customer.is_deleted = 1;

                axios.put(`/delete_customer/${customer.id}`, customer)
                    .then((response) => {

                        if (response.status === 200) {

                            this.fetchCustomerDetails();
                            alert('Customer deleted successfully.');
                        } else {
                            alert('Failed to delete customer.');
                        }
                    })
                    .catch((error) => {
                        console.error('Error deleting customer:', error);
                        alert('Failed to delete customer.');
                    });
            }
        },
        viewTransactions(customer) {

            const transactionsUrl = `/dashboard_customers_transactions/${customer.id}`;

            window.location.href = transactionsUrl;
        },
        addTransactions(customer, index) {

            this.showAddTransactionCard[index] = true;
            this.transaction.customer_id = customer.id;
        },
        saveTransaction() {

            axios.post("/save_transaction", this.transaction)
                .then(
                    ({ data }) => {
                        alert("New transaction saved!");
                        this.fetchCustomerDetails();
                    }
                ).catch((error) => {
                    console.error('Error saving transaction:', error);
                    alert('Failed to save transaction.');
                });

        },

    },
}

</script>
