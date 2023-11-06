import React from "react";
import {Link} from 'react-router-dom'
import withRouter from "./withRouter.js";

class Update extends React.Component {
	constructor() {
		super();
	}
	
	componentDidMount() {
		this.state.dept = this.props.location.state.dept
		this.forceUpdate();
	}
	
	onChange(e) {
		this.state.dept[e.target.name] = e.target.value;
		this.forceUpdate();
	}
	
	async onSubmit(e) {
		e.preventDefault();
		console.log('submit...');
		
		let response = await fetch('/rest/dept', {
			method: "PUT",
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify(this.state.dept)
		})
		
		if (response.ok) {
			alert('부서 수정 성공!')
			this.props.navigate('/rest/dept')
		} else {
			let json = await response.json();
			alert('수정 실패!' + json.message);
		}
	}
	
	state = {
		dept: {
			deptno: "",
			dname: "",
			loc: ""
		}
	}
	
	render() {
		return (
			<>
			<h1>부서 수정</h1>
			<hr/>
			<Link to='/rest/dept' id="link">목록으로 이동</Link>
			<form onSubmit={event => this.onSubmit(event)}>
				<fieldset>
					<legend>deptno</legend>
					<input disabled value={this.state.dept.deptno}/>
				</fieldset>
				<fieldset>
					<legend>dname</legend>
					<input name="dname" value={this.state.dept.dname==null ? "": this.state.dept.dname} maxLength={35} onChange={event => this.onChange(event)} required/>
				</fieldset>
				<fieldset>
					<legend>loc</legend>
					<input name="loc" value={this.state.dept.loc==null ? "": this.state.dept.loc} maxLength={13} onChange={event => this.onChange(event)}/>
				</fieldset>
				<fieldset>
					<input type="submit" value='부서수정'/>
				</fieldset>
			</form>
			</>
		)
	}
	
}


export default withRouter(Update);