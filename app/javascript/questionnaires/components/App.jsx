// app/javascript/quotes/components/App.jsx
import React from 'react'
import {
  BrowserRouter as Router,
  Route
} from 'react-router-dom'
import QuestionnairesDisplay from './QuestionnairesDisplay'

const App = (props) => (
  <Router>
	<div>
	  <Route
	    path='/'
	    component={QuestionnairesDisplay}
	  />
	</div>
  </Router>
)

export default App
