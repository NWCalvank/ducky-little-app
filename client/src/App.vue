<template>
  <div id="app">
    <Header msg="A Ducky Little App"/>

    <button id="download-btn" @click="download">
      Download Current Data
    </button>

    <Form />
  </div>
</template>

<script>
import Header from './components/Header.vue'
import Form from './components/Form.vue'

const apiPath = process.env.VUE_APP_API

export default {
  name: 'app',
  components: {
    Header,
    Form
  },
  methods: {
    download: function(){
      const now = new Date(Date.now())
      const today = now.toISOString().split('T')[0]
      window.location = `${apiPath}/reports?end_date=${today}`
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
