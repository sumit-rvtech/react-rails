@RecordForm = React.createClass
	getInitialState: ->
		title: ''
		date: ''
		amount: ''

	valid: ->
		@state.title && @state.date && @state.amount

	handleChange: (e) ->
		name = e.target.name
		@setState "#{ name }": e.target.value

	handleSubmit: (e) ->
		e.preventDefault()
		$.post '', { record: @state }, (data) =>
			@props.handleNewRecord data
			@setState @getInitialState()
			, 'JSON'

	render: ->
		React.DOM.form
			className: 'form-inline'
			onSubmit: @handleSubmit
			React.DOM.div
				className: 'form-group col-xs-3'
				React.DOM.input
					type: 'text'
					className: 'form-control datepicker'
					placeholder: 'Date'
					name: 'date'
					value: @state.date
					onChange: @handleChange
			React.DOM.div
				className: 'form-group col-xs-3'
				React.DOM.input
					type: 'text'
					className: 'form-control'
					placeholder: 'Title'
					name: 'title'
					value: @state.title
					onChange: @handleChange
			React.DOM.div
				className: 'form-group col-xs-3'
				React.DOM.input
					type: 'number'
					className: 'form-control'
					placeholder: 'Amount'
					name: 'amount'
					value: @state.amount
					onChange: @handleChange
			React.DOM.button
				type: 'submit'
				className: 'btn btn-primary col-xs-2'
				disabled: !@valid()
				'Create record'