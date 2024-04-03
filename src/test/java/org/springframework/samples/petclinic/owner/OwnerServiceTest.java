import static org.mockito.Mockito.when;
import static org.mockito.ArgumentMatchers.anyLong;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.example.petclinic.model.Owner;
import com.example.petclinic.repository.OwnerRepository;
import com.example.petclinic.service.OwnerService;
import com.example.petclinic.service.OwnerServiceImpl;

@SpringBootTest
public class OwnerServiceTest {

    @Mock
    private OwnerRepository ownerRepository;

    @InjectMocks
    private OwnerService ownerService = new OwnerServiceImpl();

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void testFindAllOwners() {
        Owner owner1 = new Owner();
        owner1.setId(1L);
        owner1.setFirstName("John");
        owner1.setLastName("Doe");

        Owner owner2 = new Owner();
        owner2.setId(2L);
        owner2.setFirstName("Jane");
        owner2.setLastName("Smith");

        List<Owner> owners = Arrays.asList(owner1, owner2);

        when(ownerRepository.findAll()).thenReturn(owners);

        List<Owner> ownersResult = ownerService.findAllOwners();

        assertNotNull(ownersResult);
        assertEquals(2, ownersResult.size());
        assertEquals("John", ownersResult.get(0).getFirstName());
        assertEquals("Jane", ownersResult.get(1).getFirstName());
    }

    @Test
    public void testFindOwnerById() {
        Owner owner = new Owner();
        owner.setId(1L);
        owner.setFirstName("John");
        owner.setLastName("Doe");

        when(ownerRepository.findById(anyLong())).thenReturn(Optional.of(owner));

        Owner foundOwner = ownerService.findOwnerById(1L);

        assertNotNull(foundOwner);
        assertEquals("John", foundOwner.getFirstName());
    }

    // Add more test cases as needed

}
