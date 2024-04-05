<template>
    <div>
      <b-navbar toggleable="md" type="dark" variant="info">
        <b-navbar-brand href="/">
              <b-img src="http://localhost:8084/public/EShopping/logo.png" al t="logo" width="70px" height="60px" />
            </b-navbar-brand>
        <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
        <b-collapse id="nav-collapse" is-nav>
          <b-navbar-nav class="mr-auto">
            <b-nav-item to="/admin" class="ml-2">
              <div style="color: #fff; font-size: 18px">Tableau de bord</div>
            </b-nav-item>
            <b-nav-item to="/admin/users" class="ml-2">
              <div style="color: #fff; font-size: 18px">Utilisateurs</div>
            </b-nav-item>
            <b-nav-item to="/admin/addSupplier" class="ml-2">
              <div style="color: #fff; font-size: 18px">Ajouter un Fournisseur</div>
            </b-nav-item>
            <b-nav-item to="/admin/addCompany" class="ml-2">
              <div style="color: #fff; font-size: 18px">Ajouter une Entreprise</div>
            </b-nav-item>
            <b-nav-item to="/admin/newContract" class="ml-2">
              <div style="color: #fff; font-size: 18px">Nouveau Contrat</div>
            </b-nav-item>
            <b-nav-item to="/admin/orders" class="ml-2">
              <div style="color: #fff; font-size: 18px">Commandes</div>
            </b-nav-item>
          </b-navbar-nav>
          <b-navbar-nav class="ml-auto">
            <b-nav-item>
              <b-img height="35px" width="35px" :src="user.profileImage"></b-img>
            </b-nav-item>
            <b-nav-item-dropdown right>
              <template #button-content>
                <em v-if="user.username" style="color: #fff">
                  {{ user.username }}
                </em>
                <em v-if="!user.username" style="color: #fff">
                  {{ user.firstName }} {{ user.lastName }}
                </em>
              </template>
              <b-dropdown-item to="/admin/profile">Profil d'Administrateur</b-dropdown-item>
              <b-dropdown-item @click="logout()">se déconnecter</b-dropdown-item>
            </b-nav-item-dropdown>
          </b-navbar-nav>
        </b-collapse>
      </b-navbar>
    </div>
  </template>
  
  <script>
  import { mapState } from "vuex";
  export default {
    name: "ATopHeader",
    components: {},
    data() {
      return {
        companyLogo: "",
      };
    },
    async mounted() {
      this.companyLogo = await this.$store.dispatch("Company/getCompanyLogo");
    },
    methods: {
      logout() {
        this.$store.dispatch("CurrentUser/setToken", "");
        this.$store.dispatch("CurrentUser/setUser", {});
        this.$store.dispatch("Wishlist/clearWishlist");
        this.$store.dispatch("Cart/clearCart");
        
        this.$router.push({ path: "/" });
      },
    },
    computed: {
      ...mapState({
        user: (state) => state.CurrentUser.user,
        userLoggedIn: (state) => state.CurrentUser.userLoggedIn,
      }),
    },
  };
  </script>
  
  <style lang="scss" scoped></style>
  