<template>
    <div>
      <TopHeader />
      <b-container class="mt-4">
        <b-row align-h="center">
          <div class="text-center">
            <div style="font-size: 100px">404</div>
            <h4>Page non trouvée.</h4>
            <h6>Cette URL demandée est introuvable sur ce serveur.</h6>
            <a href="/"><b-icon icon="arrow-left" />Retour à la page d'accueil</a>
          </div>
        </b-row>
      </b-container>
      <MyFooter class="mt-5" />
    </div>
  </template>
  
  <script>
  import TopHeader from "@/components/Common/TopHeader.vue";
  import MyFooter from "@/components/Common/MyFooter.vue";
  export default {
    name: "NotFound",
    components: {
      TopHeader,
      MyFooter,
    },
    data() {
      return {};
    },
    mounted() {},
    methods: {},
    computed: {},
  };
  </script>
  
  <style lang="scss" scoped></style>
  