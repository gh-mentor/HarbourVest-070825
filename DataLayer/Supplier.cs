namespace DataLayer
{
    public class Supplier
    {
        private string? m_name;
        private string? m_address;
        private string? m_city;
        private string? m_state;
        private string? m_zip;
        private string? m_description;

        // Required constructor (all columns except ID)
        public Supplier(string? name, string? address, string? city, string? state, string? zip, string? description)
        {
            m_name = name;
            m_address = address;
            m_city = city;
            m_state = state;
            m_zip = zip;
            m_description = description;
        }

        public string? Name
        {
            get => m_name;
            set => m_name = value;
        }

        public string? Address
        {
            get => m_address;
            set => m_address = value;
        }

        public string? City
        {
            get => m_city;
            set => m_city = value;
        }

        public string? State
        {
            get => m_state;
            set => m_state = value;
        }

        public string? Zip
        {
            get => m_zip;
            set => m_zip = value;
        }

        public string? Description
        {
            get => m_description;
            set => m_description = value;
        }
    }