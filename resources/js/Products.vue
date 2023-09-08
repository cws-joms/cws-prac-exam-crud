<template>
    <div class="container">
        <h2 class="mb-2">{{ displayActionLabel }} Product</h2>
        <div class="row mb-4">
            <div class="col-12">
                <form @submit.prevent="save">
                    <div class="form-group">
                        <label>Name</label>
                        <input type="text" v-model="product.name" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Description</label>
                        <textarea v-model="product.description" class="form-control" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input type="number" v-model="product.quantity" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" v-model="product.unit_price" class="form-control" required>
                    </div>
                    <button type="submit" class="btn btn-primary mt-2">Save</button>
                </form>
            </div>
        </div>
        <h2 class="mb-2">Manage Products</h2>
        <table class="table table-bordered table-light mt-2">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Description</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody v-if="products.length">
                <tr v-for="product in products" :key="product.id">
                    <td>{{ product.id }}</td>
                    <td>{{ product.name }}</td>
                    <td>{{ product.description }}</td>
                    <td>{{ product.quantity }}</td>
                    <td>{{ product.unit_price }}</td>
                    <td>
                        <button type="button" class="btn btn-warning mx-2" @click="edit(product)">Edit</button>
                        <button type="button" class="btn btn-danger" @click="remove(product)">Delete</button>
                    </td>
                </tr>
            </tbody>
            <div class="row" v-else>
                <div class="col">
                    <p class="text-center">No products found.</p>
                </div>
            </div>
        </table>
    </div>
</template>

<script>
export default {
    name: 'ProductsView',
    data() {
        return {
            products: {},
            product: {
                id: '',
                name: '',
                description: '',
                quantity: 0,
                unit_price: 0,
            },
            actionLabel: ''
        }
    },
    created() {
        this.fetchProductDetails();
    },
    computed: {
        displayActionLabel() {
            return this.actionLabel === '' ? 'Add' : this.actionLabel;
        },
    },
    methods: {
        fetchProductDetails() {

            axios.get('/products')
                .then((response) => {

                    console.log(response.data);
                    this.products = response.data;
                })
                .catch((error) => {

                    console.error('Error fetching products details:', error);
                });
        },
        save() {
            if (this.product.id === '') {
                this.saveProduct();
            } else {
                this.updateProduct();
            }
        },
        saveProduct() {

            axios.post("/save_product", this.product)
                .then(
                    ({ data }) => {
                        alert("New product saved!");
                        this.fetchProductDetails();
                    }
                ).catch((error) => {
                    console.error('Error saving product:', error);
                    alert('Failed to save product.');
                });
        },
        edit(product) {
            this.actionLabel = 'Edit';
            this.product = product;
        },
        updateProduct() {

            var editrecords = '/update_product/' + this.product.id;
            axios.put(editrecords, this.product)
                .then(
                    ({ data }) => {
                        this.product.name = '',
                            this.product.description = '',
                            this.product.quantity = 0,
                            this.product.unit_price = 0

                        alert("Info successfully updated!");
                        this.fetchProductDetails();
                    }
                ).catch((error) => {
                    console.error('Error updating data:', error);
                    alert('Failed to update user.');
                });
        },
        remove(product) {
            if (confirm('Are you sure you want to delete this product?')) {

                product.is_deleted = 1;

                axios.put(`/delete_product/${product.id}`, product)
                    .then((response) => {

                        if (response.status === 200) {

                            this.fetchProductDetails();
                            alert('Product deleted successfully.');
                        } else {
                            alert('Failed to delete product.');
                        }
                    })
                    .catch((error) => {
                        console.error('Error deleting product:', error);
                        alert('Failed to delete product.');
                    });
            }
        },
    },
}
</script>
