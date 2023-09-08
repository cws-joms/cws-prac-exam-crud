import "./bootstrap";
import "../sass/app.scss";

import { createApp } from "vue";

import Users from "./Users.vue";
createApp(Users).mount("#users");

import Customers from "./Customers.vue";
createApp(Customers).mount("#customers");

import Transactions from "./Transactions.vue";
createApp(Transactions).mount("#transactions");

import Products from "./Products.vue";
createApp(Products).mount("#products");


