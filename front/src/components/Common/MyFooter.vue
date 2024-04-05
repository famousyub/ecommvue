<template>
<footer class="bg-gray-900 text-white pt-12 pb-8 px-4">
    <div class="mx-auto px-4 container overflow-hidden flex flex-col lg:flex-row justify-between">
  <div class="bg-dark text-white py-5 w-2/3 block sm:flex text-sm mt-6 lg:mt-0">
    <b-container>
      <b-row>
        <b-col md="5">
          <h2 class="mb-4"><strong>{{ company.name }}</strong></h2>
          <p>{{ company.motive }}</p>
          <p>{{ company.details }}</p>
        </b-col>
        <b-col md="3">
          <h3 class="mb-4">Liens</h3>
          <b-link href="/profile" class="text-white">Mon Profile</b-link><br />
          <b-link href="/*" class="text-white">Terms & Conditions</b-link><br />
        </b-col>
        <b-col md="4">
          <h3 class="mb-4">Localisation</h3>
          <div v-html="company.location"></div>
          <div class="mt-3">
            <b-icon icon="phone" class="mr-1" /> {{ company.phoneNo }} <br />
            <b-icon icon="envelope" class="mr-1" /> {{ company.email }} <br />
          </div>
        </b-col>
      </b-row>
      <hr class="bg-light" />
      <h5 class="mt-4">© 2023, All rights reserved</h5>
    </b-container>
  </div>
   </div>

</footer>


</template>

<script>
export default {
  name: "MyFooter",
  data() {
    return {
      company: {
        "name": "E Shopping",
        "icon": "",
        "logo": "http://localhost:8084/public/company/EShopping/logo.avif",
        "code": "EShopping",
        "email": "eshopcommerce11@gmail.com",
        "phoneNo": "+216 55491729",
        "location": "Sfax, Tunisie",
        "header": "Trouvez ce dont vous avez besoin ici",
        "motive": "Confort et commodité. EShopping n'est qu'un projet logiciel. Il est développé pour apprendre à créer une application Web. J'ai inclus toutes ces données provenant d'Internet à partir de différents types de sources. Et ce n'est pas un vrai site de commerce électronique.",
        "details": "Créé par Zied Ammar",
      },
    };
  },
};
</script>

<style scoped>
/* Ajoutez vos styles personnalisés ici si nécessaire */
</style>
