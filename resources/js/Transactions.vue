<template>
    <div>
        <table class="table table-bordered table-light mt-2">
            <thead>
                <tr>
                    <th scope="col">Reference #</th>
                    <th scope="col">Product name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Gross Price</th>
                    <th scope="col">Date</th>
                </tr>
            </thead>
            <tbody v-if="transactions.length">
                <tr v-for="transaction in transactions" :key="transaction.id">
                    <td>{{ transaction.reference_id }}</td>
                    <td>{{ transaction.product_name }}</td>
                    <td>{{ transaction.quantity }}</td>
                    <td>{{ transaction.unit_price }}</td>
                    <td>{{ calculateGrossPrice(transaction) }}</td> <!-- Pass the current transaction to the method -->
                    <td>{{ transaction.created_at }}</td>
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
    data() {
        return {
            transactions: []
        };
    },
    mounted() {

        const pathSegments = window.location.pathname.split('/');
        const customerId = pathSegments[pathSegments.length - 1];
        console.log(customerId);
        if (customerId) {
            this.fetchTransactions(customerId);
        }
    },
    methods: {
        fetchTransactions(customerId) {
            axios.get(`/transactions/${customerId}`)
                .then((response) => {
                    this.transactions = response.data;
                })
                .catch((error) => {
                    console.error('Error fetching transactions:', error);
                });
        },
        calculateGrossPrice(transaction) {
            return transaction.quantity * transaction.unit_price;
        },
    },
};
</script>
