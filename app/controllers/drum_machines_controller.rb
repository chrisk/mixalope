class DrumMachinesController < ApplicationController
  # GET /drum_machines
  # GET /drum_machines.xml
  def index
    @drum_machines = DrumMachine.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @drum_machines }
    end
  end

  # GET /drum_machines/1
  # GET /drum_machines/1.xml
  def show
    @drum_machine = DrumMachine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drum_machine }
    end
  end

  # GET /drum_machines/new
  # GET /drum_machines/new.xml
  def new
    @drum_machine = DrumMachine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drum_machine }
    end
  end

  # GET /drum_machines/1/edit
  def edit
    @drum_machine = DrumMachine.find(params[:id])
  end

  # POST /drum_machines
  # POST /drum_machines.xml
  def create
    @drum_machine = DrumMachine.new(params[:drum_machine])

    respond_to do |format|
      if @drum_machine.save
        flash[:notice] = 'DrumMachine was successfully created.'
        format.html { redirect_to(@drum_machine) }
        format.xml  { render :xml => @drum_machine, :status => :created, :location => @drum_machine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drum_machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /drum_machines/1
  # PUT /drum_machines/1.xml
  def update
    @drum_machine = DrumMachine.find(params[:id])

    respond_to do |format|
      if @drum_machine.update_attributes(params[:drum_machine])
        flash[:notice] = 'DrumMachine was successfully updated.'
        format.html { redirect_to(@drum_machine) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drum_machine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /drum_machines/1
  # DELETE /drum_machines/1.xml
  def destroy
    @drum_machine = DrumMachine.find(params[:id])
    @drum_machine.destroy

    respond_to do |format|
      format.html { redirect_to(drum_machines_url) }
      format.xml  { head :ok }
    end
  end
end
