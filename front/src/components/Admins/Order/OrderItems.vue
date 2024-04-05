<template>
    <div>
      <b-row>
        <b-col cols="6" v-for="orderItem in orderItems" :key="orderItem.id">
          <b-card-group deck>
            <b-card img-top style="max-width: 14rem" class="mb-4">
              <b-card-img
                :src="orderItem.Product.image1"
                style="max-width: 14rem; max-height: 14rem"
                alt="Image Not Found"
              />
              <br />
              <b-link :to="{ path: `/product/${orderItem.Product.id}` }">
                {{ orderItem.Product.title }}
              </b-link>
              <br />
              <small class="mt-2">
                Price: {{ orderItem.Product.amount }}
                {{ orderItem.Product.currency }}
              </small>
              <br />
              <small class="mt-2">Quantité: {{ orderItem.quantity }}</small>
              <br />
              <small class="mt-2">
                Cost: {{ orderItem.Product.amount * orderItem.quantity }}
                {{ orderItem.Product.currency }}
              </small>
            </b-card>
          </b-card-group>
        </b-col>
      </b-row>
      <b-row>
        <b-col>
          <h5 class="font-weight-bold">État de mise à jour</h5>
          <hr />
          <b-row>
            <b-col cols="5">
              <b-dropdown
                id="dropdown-left"
                :text="orderStatus"
                block
                :variant="statusVariant"
              >
                <b-dropdown-item
                  v-for="(status, idx) in allStatus"
                  :key="idx"
                  @click="updateStatus(status)"
                >
                  {{ status.name }}
                </b-dropdown-item>
              </b-dropdown>
            </b-col>
          </b-row>
         
        </b-col>
      </b-row>
    </div>
  </template>
  
  <script>
  import OrderItemService from "@/services/OrderItemService.js";
  import OrderService from "@/services/OrderService.js";
  export default {
    name: "OrderItems",
    props: {
      orderItems: {
        type: Array,
        required: true,
      },
      orderInfo: {
        type: Object,
        required: true,
      },
    },
    components: {},
    data() {
      return {
        orderStatus: this.orderInfo.status,
        statusVariant: this.orderInfo.variant,
        allStatus: [
         
          {
            name: "en cours",
            variant: "info",
          },
          {
            name: "en chemin",
            variant: "warning",
          },
          {
            name: "complète",
            variant: "success",
          },
        ],
      };
    },
    mounted() {},
    methods: {
      async updateStatus(status) {
        this.orderStatus = status.name;
        this.statusVariant = status.variant;
        try {
          await OrderService.updateOrder({
            id: this.orderInfo.id,
            status: status.name,
            variant: status.variant,
          });
        } catch (error) {
          console.log(error.response.data.error);
        }
      },
      async deleteOrder() {
        for (var i in this.orderItems) {
          try {
            await OrderItemService.deleteOrderItem(this.orderItems[i].id);
          } catch (error) {
            console.log(error.response.data.error);
          }
        }
        try {
          await OrderService.deleteOrder(this.orderInfo.id);
        } catch (error) {
          console.log(error.response.data.error);
        }
        this.$router.push({ path: "/admin/orders" });
      },
    },
    computed: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  