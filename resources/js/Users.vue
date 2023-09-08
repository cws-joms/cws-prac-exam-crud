<template>
    <div class="container">
        <h2 class="mb-2">{{ displayActionLabel }} User</h2>
        <div class="row mb-4">
            <div class="col-12">
                <form @submit.prevent="save">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" v-model="user.name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" v-model="user.email" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select v-model="user.role" id="role" class="form-control" required>
                            <option value="ADMIN">ADMIN</option>
                            <option value="USER">USER</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" v-model="user.password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-primary mt-2">Save</button>
                </form>
            </div>
        </div>
        <h2 class="mb-2">Manage Users</h2>
        <table class="table table-bordered table-light mt-2">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Role</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody v-if="result.length">
                <tr v-for="user in result" v-bind:key="user.id">
                    <td>{{ user.id }}</td>
                    <td>{{ user.name }}</td>
                    <td>{{ user.email }}</td>
                    <td>{{ user.role }}</td>
                    <td>
                        <button type="button" class="btn btn-warning mx-2" @click="edit(user)">Edit</button>
                        <button type="button" class="btn btn-danger" @click="remove(user)">Delete</button>
                    </td>
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
    name: 'UsersView',
    data() {
        return {
            result: {},
            user: {
                id: '',
                name: '',
                email: '',
                role: '',
                is_deleted: 0,
            },
            actionLabel: ''
        }
    },
    created() {

    },
    mounted() {
        this.fetchUserDetails()
    },
    computed: {
        displayActionLabel() {
            return this.actionLabel === '' ? 'Add' : this.actionLabel;
        },
    },
    methods: {
        fetchUserDetails() {

            axios.get('/users')
                .then((response) => {

                    console.log(response.data);
                    this.result = response.data;
                })
                .catch((error) => {

                    console.error('Error fetching user details:', error);
                });
        },
        save() {
            if (this.user.id == '') {
                this.saveData();
            }
            else {
                this.updateData();
            }

        },
        saveData() {
            axios.post("/save_user", this.user)
                .then(
                    ({ data }) => {
                        alert("New user saved!");
                        this.fetchUserDetails();
                    }
                ).catch((error) => {
                    console.error('Error saving user:', error);
                    alert('Failed to save user.');
                });

        },
        edit(user) {
            this.actionLabel = 'Edit';
            this.user = user;

        },
        updateData() {

            var editrecords = '/update_user/' + this.user.id;
            axios.put(editrecords, this.user)
                .then(
                    ({ data }) => {
                        this.user.name = '',
                            this.user.email = '',
                            this.user.password = '',
                            this.user.role = ''

                        alert("Info successfully updated!");
                        this.fetchUserDetails();
                    }
                ).catch((error) => {
                    console.error('Error updating data:', error);
                    alert('Failed to update user.');
                });

        },
        remove(user) {

            if (confirm('Are you sure you want to delete this user?')) {

                user.is_deleted = 1;

                axios.put(`/delete_user/${user.id}`, user)
                    .then((response) => {

                        if (response.status === 200) {

                            this.fetchUserDetails();
                            alert('User deleted successfully.');
                        } else {
                            alert('Failed to delete user.');
                        }
                    })
                    .catch((error) => {
                        console.error('Error deleting user:', error);
                        alert('Failed to delete user.');
                    });
            }
        },

    },
}

</script>
