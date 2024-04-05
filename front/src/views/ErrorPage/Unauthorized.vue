<template>
    <div>
      <TopHeader />
      <b-container class="mt-4">
        <b-row align-h="center">
          <div class="text-center">
            <div style="font-size: 100px">401</div>
            <h4>Non autorisé</h4>
            <h6>L'accès à cette ressource est refusé.</h6>
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
    name: "Unauthorized",
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
  