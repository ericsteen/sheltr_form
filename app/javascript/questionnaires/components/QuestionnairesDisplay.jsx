import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class QuestionnairesDisplay extends React.Component {
  constructor () {
    super();
    this.state = {
      ready: false,
      questionnaire: {},
      sections: {}
    };
  }

  fetchQuote (id) {
    axios.get( `questionnaires/${id}` )
        .then(response => {
          console.log('questionnaire', response.data )
          this.setState({ questionnaire: response.data });
        })
        .catch(error => {
          console.error(error);
        });
  }

  setQuoteIdFromQueryString (qs) {
    this.qsParams = queryString.parse(qs);
    if (this.qsParams.questionnaire) {
      // assign questionnaire ID from the URL's query string
      this.questionnaireId = Number(this.qsParams.questionnaire);
    } else {
      this.questionnaireId = 1;
      // update URL in browser to reflect current questionnaire in query string
      this.props.history.push(`/?questionnaire=${this.questionnaireId}`);
    }
  }

  componentWillReceiveProps (nextProps) {
    this.setQuoteIdFromQueryString(nextProps.location.search);
    this.fetchQuote(this.questionnaireId);
  }

  componentDidMount = () => {
    this.setQuoteIdFromQueryString(this.props.location.search);
    this.fetchQuote(this.questionnaireId);
    this.setState({ ready: true });
    var that = this

    window.addEventListener('scroll', this.handleScroll);
  }

  handleScroll = () => {
    var self = this
    $('.upform').find('.input-block').each((idx, e) => {
      var diff, etop;
      etop = $(e).offset().top;
      diff = etop - $(window).scrollTop();
      if (diff > 100 && diff < 300) {
        self.reinitState(e);
      }
    });
  }

  reinitState = (e) => {
    $('.upform').find('.input-block').removeClass('active')
    $('.upform').find('.input-block input').each(() => {
      $(this).blur()
    })
    $(e).addClass('active')
    $(e).find('input').focus();
  }

  reinit = (e) => {
    this.reinitState(e)
    this.rescroll(e)
  }

  moveNext = (e) => {
    $(e.currentTarget).parent().parent().next().click()
  }

  movePrev = (e) => {
    $(e).parent().parent().prev().click()
  }

  handleChange = (e) => {
    this.moveNext(e)
  }

  rescroll = (e) => {
    e.preventDefault()
    $([document.documentElement, document.body]).stop().animate({
          scrollTop: $(e.target).offset().top - 200
      }, 300);
  }


  renderQuestionnaire = (questionnaire) => {
    const {
      name: qname,
      sections
    } = questionnaire

    const qRows = []

    for (const section of sections) {
      const { questions } = section
      for (const question of questions) {
        qRows.push(
          <div onClick={(e) => this.rescroll(e)} key={question.name} className="input-block">
            <div className="label">{question.name}</div>
            <div className="input-control">
              <input onChange={(e) => this.moveNext(e)} id="toggle-on-q1" className="toggle toggle-left" name="q1" value="yes" type={question.input_type}></input>
              <label htmlFor="toggle-on-q1" className="btn"><span>A</span> Yes</label>
              <input onChange={(e) => this.moveNext(e)} id="toggle-off-q1" className="toggle toggle-right" name="q1" value="no" type={question.input_type}></input>
              <label htmlFor="toggle-off-q1" className="btn"><span>B</span> No</label>
            </div>
          </div>
        )
      }
    }
    return qRows
  }

  render () {
    const { ready, questionnaire } = this.state
    const nextQuoteId = Number(this.state.questionnaire.id) + 1;

    return (
      <div ref={el => this.el = el} className="upform">
        <form>

          <div className="upform-header"></div>

          <div className="upform-main">
            { ready ? questionnaire.sections && this.renderQuestionnaire(questionnaire) : <div>Loading...</div>}

          </div>

          <div className="upform-footer">
            <button type="submit" className="btn btn-primary btn-lg">Submit</button>
          </div>

        </form>


      </div>
    );
  }
}

export default QuestionnairesDisplay;
