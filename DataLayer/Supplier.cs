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
        /// <summary>
        /// Initializes a new instance of the <see cref="Supplier"/> class with the specified details.
        /// </summary>
        /// <param name="name">The name of the supplier. Cannot be null or empty.</param>
        /// <param name="address">The address of the supplier. Cannot be null or empty.</param>
        /// <param name="city">The city where the supplier is located. Cannot be null or empty.</param>
        /// <param name="state">The state where the supplier is located. Cannot be null or empty.</param>
        /// <param name="zip">The ZIP code of the supplier's address. Cannot be null or empty.</param>
        /// <param name="description">An optional description of the supplier. Can be null or empty.</param>
        /// <exception cref="ArgumentException">
        /// Thrown when <paramref name="name"/>, <paramref name="address"/>, <paramref name="city"/>, <paramref name="state"/>, or <paramref name="zip"/> is null or empty.
        /// </exception>
        public Supplier(string? name, string? address, string? city, string? state, string? zip, string? description)
        {
            if (string.IsNullOrWhiteSpace(name))
                throw new ArgumentException("Name cannot be null or empty.", nameof(name));
            if (string.IsNullOrWhiteSpace(address))
                throw new ArgumentException("Address cannot be null or empty.", nameof(address));
            if (string.IsNullOrWhiteSpace(city))
                throw new ArgumentException("City cannot be null or empty.", nameof(city));
            if (string.IsNullOrWhiteSpace(state))
                throw new ArgumentException("State cannot be null or empty.", nameof(state));
            if (string.IsNullOrWhiteSpace(zip))
                throw new ArgumentException("Zip cannot be null or empty.", nameof(zip));
            // Description can be null or empty

            m_name = name;
            m_address = address;
            m_city = city;
            m_state = state;
            m_zip = zip;
            m_description = description;
        }

        /// <summary>
        /// Gets or sets the name of the supplier.
        /// This property cannot be null or empty.
        /// </summary>
        public string? Name
        {
            get => m_name;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Name cannot be null or empty.", nameof(value));
                m_name = value;
            }
        }

        public string? Address
        {
            get => m_address;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Address cannot be null or empty.", nameof(value));
                m_address = value;
            }
        }

        public string? City
        {
            get => m_city;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("City cannot be null or empty.", nameof(value));
                m_city = value;
            }
        }

        public string? State
        {
            get => m_state;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("State cannot be null or empty.", nameof(value));
                m_state = value;
            }
        }

        public string? Zip
        {
            get => m_zip;
            set
            {
                if (string.IsNullOrWhiteSpace(value))
                    throw new ArgumentException("Zip cannot be null or empty.", nameof(value));
                m_zip = value;
            }
        }

        public string? Description
        {
            get => m_description;
            set => m_description = value;
        }
    }

}