public class WrapperCompany {
	public String companyName;
    public String ceo;
    public String employees;
    public long revenue;
    
    private List<Client> customers = new List<Client>();
    
    public void addCustomer(String name, String email , long phone, String website){
        CLient cl = new Client(name,email,phone,website);
        customers.add(cl);
    }
    public void getClients(){
        for (Client cl : customers){
            System.debug('Name'+cl.clientName+ 'email'+cl.email+ 'phone'+cl.phone+ 'website'+cl.website);
        }
    }
    public class Client{
        public String clientName;
        public String email;
        public long phone;
        public String website;
        Client(String clientName, String email, long phone, String Website){
            this.clientName = clientName;
            this.email = email;
            this.phone = phone;
            this.website = website;
        }
    }
}