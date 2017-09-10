import autobind from 'react-autobind';
import React from 'react';
import { Form, Input } from 'reactstrap';
import validator from 'validator';
import SuperAgent from 'superagent';

class Conversion extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      disabled: true,
    }
    autobind(this);
  }

  onEmailChange(e){
    let val = e.target.value;

    if (!validator.isEmail(val)) {
      this.setState({disabled: true})
      return;
    }

    this.setState({
      disabled: false,
      email: val,
    })
  }

  onSubmit(e){
    e.preventDefault();

    SuperAgent
      .post('/conversion')
      .send({ conversion: {email: this.state.email} })
      .end((err, res) => {
        if (res.ok) {
          this.setState({success: true});
        } else {
          this.setState({
            errors: res.body.errors,
          });
        }
      })
  }

  render(){
    if (this.state.success){
      return(
        <div className="card">
          <div className="card-body text-center">
            <h4>Conversion Successful!</h4>
          </div>
        </div>
      )
    }
    return (
      <div className="card">
        <div className="card-body">
          <h4 className="mb10">Conversion Form</h4>
          <Form onSubmit={(e)=>{e.preventDefault()}}>
            <Input onChange={this.onEmailChange} placeholder="Enter your email ..."/>
            <div className="mt15">
              <button onClick={this.onSubmit} className="btn btn-primary" disabled={this.state.disabled}>Join Now</button>
            </div>
          </Form>
        </div>
      </div>
    )
  }
}

export default Conversion;
