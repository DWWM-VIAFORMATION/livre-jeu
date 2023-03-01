<?php

namespace App\Entity;

use App\Repository\PersonnageRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PersonnageRepository::class)]
class Personnage
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $prenom = null;

    #[ORM\ManyToOne(inversedBy: 'personnages')]
    private ?Avatar $avatar = null;

    #[ORM\ManyToMany(targetEntity: Aventure::class, inversedBy: 'personnages')]
    private Collection $aventures;

    #[ORM\Column(length: 255)]
    private ?string $nom = null;

    public function __construct()
    {
        $this->aventures = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self
    {
        $this->prenom = $prenom;

        return $this;
    }

    public function getAvatar(): ?Avatar
    {
        return $this->avatar;
    }

    public function setAvatar(?Avatar $avatar): self
    {
        $this->avatar = $avatar;

        return $this;
    }

    /**
     * @return Collection<int, Aventure>
     */
    public function getAventures(): Collection
    {
        return $this->aventures;
    }

    public function addAventure(Aventure $aventure): self
    {
        if (!$this->aventures->contains($aventure)) {
            $this->aventures->add($aventure);
        }

        return $this;
    }

    public function removeAventure(Aventure $aventure): self
    {
        $this->aventures->removeElement($aventure);

        return $this;
    }
    
    public function __toString()
    {
        return $this->prenom." ".$this->nom;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nom): self
    {
        $this->nom = $nom;

        return $this;
    }
}
